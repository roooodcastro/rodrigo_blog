$(document).on('turbolinks:load', function () {
    let shareButtonsDiv = $('#blogSidebarShareButtons');
    if (shareButtonsDiv.length > 0) {
        $(document).on('click', '#blogSidebarShareButtons a', function(ev) {
            openCenteredPopup(this.href, 'sharewin', 800, 600);
            ev.preventDefault();
        });
    }
});

// Credits to:
// http://www.xtf.dk/2011/08/center-new-popup-window-even-on.html
// mirror: https://stackoverflow.com/a/16861050/753012
function openCenteredPopup(url, title, w, h) {
    // Fixes dual-screen position                         Most browsers       Firefox
    let dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    let dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    let width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    let height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    let left = ((width / 2) - (w / 2)) + dualScreenLeft;
    let top = ((height / 2) - (h / 2)) + dualScreenTop;
    let newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}