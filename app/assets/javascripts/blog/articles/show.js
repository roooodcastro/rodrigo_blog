$(document).on('turbolinks:load', function () {
    if ($('.blog_articles.show').length > 0) {
        $('td.line-numbers a').each(function() {
           $(this).attr('tabindex', '-1');
        });
    }
});
