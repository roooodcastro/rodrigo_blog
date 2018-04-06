// Added to fix turbolinks anchor issue
// https://github.com/turbolinks/turbolinks/issues/75#issuecomment-244915109
const linkTargetsAnchorOnSamePage = function(link) {
    const href = link.getAttribute('href');

    if (href.charAt(0) === '#') { return true; }

    if (href.match(new RegExp(`^${window.location.toString().replace(/#.*/, '')}#`))) {
        return true;
    } else if (href.match(new RegExp(`^${window.location.pathname}#`))) {
        return true;
    }

    return false;
};

$(document).on('turbolinks:click', function(event) {
    if (linkTargetsAnchorOnSamePage(event.target)) {
        return event.preventDefault();
    }
});

$(document).on('turbolinks:load', function(event) {
    if (window.location.hash) {
        const $element = $(`a[name="${window.location.hash.substring(1)}"]`);
        return $('html, body').scrollTop($element.offset().top);
    }
});
