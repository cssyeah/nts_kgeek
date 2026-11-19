<?php

namespace Joomla\Plugin\System\Bee\Helper;

use Joomla\Filesystem\Folder;
use Joomla\Filesystem\Path;

defined('_JEXEC') or die('Restricted access');

/**
 * Reads the layout files of a template to list their sections and positions (Layouts tab).
 *
 * Standard:
 * - a section is the element whose opening tag calls `BeeSection::attrs('section-id', ...)`;
 *   it ends at the matching closing tag;
 * - positions are `<jdoc:include type="modules" name="..." />` (plus the component, the main menu
 *   rendered by BeeMenuElement and the offcanvas rendered by BeeOffcanvasElement);
 * - `BeeTemplate::renderBlock('name')` is followed into `layouts/blocks/name.php`.
 */
class BeeLayoutHelper
{
    protected const MAX_DEPTH = 5;

    /**
     * @return array [layout name => [['id' => section id or '', 'positions' => [...]], ...]]
     */
    public static function getLayouts(string $template, string $parent = ''): array
    {
        $paths = static::getPaths($template, $parent);
        $layouts = [];

        foreach ($paths as $path) {
            if (!is_dir($path)) {
                continue;
            }

            foreach (Folder::files($path, '\.php$') as $file) {
                $name = pathinfo($file, PATHINFO_FILENAME);

                if (!isset($layouts[$name])) {
                    $layouts[$name] = static::getSections($path . $file, $paths);
                }
            }
        }

        ksort($layouts);

        return $layouts;
    }

    protected static function getPaths(string $template, string $parent = ''): array
    {
        $paths = [JPATH_ROOT . "/templates/$template/layouts/"];

        if ($parent) {
            $paths[] = JPATH_ROOT . "/templates/$parent/layouts/";
        }

        return $paths;
    }

    public static function getSections(string $file, array $paths): array
    {
        $content = static::expand((string) file_get_contents($file), $paths, 0);

        // Section ranges: [id, start, end]
        $ranges = [];
        preg_match_all('/BeeSection::attrs\(\s*[\'"]([\w-]+)[\'"]/', $content, $matches, PREG_OFFSET_CAPTURE);

        foreach ($matches[1] as $match) {
            [$id, $offset] = $match;
            $ranges[] = [$id, $offset, static::findClosingTag($content, $offset)];
        }

        $sections = [];
        $outside = [];

        foreach ($ranges as [$id]) {
            $sections[$id] = ['id' => $id, 'positions' => []];
        }

        foreach (static::findPositions($content) as [$position, $offset]) {
            $owner = null;

            // Innermost section containing the position
            foreach ($ranges as [$id, $start, $end]) {
                if ($offset > $start && $offset < $end && ($owner === null || $start > $owner[1])) {
                    $owner = [$id, $start];
                }
            }

            if ($owner) {
                $sections[$owner[0]]['positions'][] = $position;
            } else {
                $outside[] = $position;
            }
        }

        $result = [];

        foreach ($sections as $section) {
            $section['positions'] = array_values(array_unique($section['positions']));
            $result[] = $section;
        }

        if ($outside) {
            $result[] = ['id' => '', 'positions' => array_values(array_unique($outside))];
        }

        return $result;
    }

    /**
     * Inline the blocks rendered by BeeTemplate::renderBlock().
     */
    protected static function expand(string $content, array $paths, int $depth): string
    {
        if ($depth >= static::MAX_DEPTH) {
            return $content;
        }

        return preg_replace_callback(
            '/BeeTemplate::renderBlock\(\s*[\'"]([\w\/-]+)[\'"]\s*\)/',
            function ($match) use ($paths, $depth) {
                $blockPaths = array_map(fn ($path) => $path . 'blocks/', $paths);
                $file = Path::find($blockPaths, $match[1] . '.php');

                if (!$file) {
                    return $match[0];
                }

                // Keep the call so the block is inlined after it, still inside the surrounding markup.
                return $match[0] . ' ?>' . static::expand((string) file_get_contents($file), $paths, $depth + 1) . '<?php ';
            },
            $content
        );
    }

    /**
     * @return array [[position, offset], ...] in document order
     */
    protected static function findPositions(string $content): array
    {
        $positions = [];
        $pattern = '/<jdoc:include\s([^>]*)>|BeeMenuElement::render\(\s*\)|BeeOffcanvasElement::render\(\s*\)/i';

        preg_match_all($pattern, $content, $matches, PREG_SET_ORDER | PREG_OFFSET_CAPTURE);

        foreach ($matches as $match) {
            $code = $match[0][0];
            $offset = $match[0][1];

            if (stripos($code, 'BeeMenuElement') === 0) {
                $positions[] = ['mainmenu', $offset];
                continue;
            }

            if (stripos($code, 'BeeOffcanvasElement') === 0) {
                $positions[] = ['offcanvas', $offset];
                continue;
            }

            $attrs = $match[1][0];
            $type = preg_match('/type="([^"]+)"/', $attrs, $m) ? $m[1] : '';

            if ($type === 'component') {
                $positions[] = ['component', $offset];
            } elseif ($type === 'modules' && preg_match('/name="([^"]+)"/', $attrs, $m)) {
                $positions[] = [$m[1], $offset];
            }
        }

        return $positions;
    }

    /**
     * Offset of the closing tag of the element whose opening tag contains $offset.
     */
    protected static function findClosingTag(string $content, int $offset): int
    {
        // Last HTML tag opened before the call (skips `<?php`)
        if (!preg_match_all('/<([a-z][a-z0-9]*)\b/i', substr($content, 0, $offset), $tags, PREG_OFFSET_CAPTURE)) {
            return strlen($content);
        }

        $last = end($tags[1]);
        $tag = strtolower($last[0]);
        $tagStart = $last[1] - 1;
        $depth = 0;

        preg_match_all('/<(\/?)' . $tag . '\b/i', $content, $matches, PREG_SET_ORDER | PREG_OFFSET_CAPTURE, $tagStart);

        foreach ($matches as $match) {
            $depth += $match[1][0] === '/' ? -1 : 1;

            if ($depth === 0) {
                return $match[0][1];
            }
        }

        return strlen($content);
    }
}
