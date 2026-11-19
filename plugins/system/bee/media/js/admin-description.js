/**
 * Template style edit: move the full template description from the
 * "Description" tab into the "Details" tab and drop the Description tab.
 */
(() => {
  const mergeDescriptionTab = () => {
    const tabSet = document.querySelector('joomla-tab#myTab');
    const descPane = tabSet && tabSet.querySelector(':scope > joomla-tab-element#description');
    const readmore = tabSet && tabSet.querySelector('joomla-tab-element#details .readmore');

    if (!descPane || !readmore) {
      return;
    }

    const content = descPane.querySelector('#fieldset-description > div') || descPane;
    const target = readmore.parentElement;
    const wasActive = descPane.hasAttribute('active');

    target.innerHTML = '';
    while (content.firstChild) {
      target.appendChild(content.firstChild);
    }

    // joomla-tab does not clean up its buttons on removal, so remove them manually.
    tabSet.querySelectorAll('[aria-controls="description"]').forEach((el) => el.remove());
    descPane.remove();

    if (wasActive) {
      const detailsButton = tabSet.querySelector('[role="tablist"] [aria-controls="details"]');
      if (detailsButton) {
        detailsButton.click();
      }
    }
  };

  if (window.customElements) {
    customElements.whenDefined('joomla-tab').then(() => {
      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', mergeDescriptionTab);
      } else {
        mergeDescriptionTab();
      }
    });
  }
})();
