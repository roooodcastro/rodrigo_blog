$(document).on('turbolinks:load', function () {
    if ($('.blog_articles.new, .blog_articles.edit').length > 0) {
        // Sorry, but this is needed because Turbolinks will not wait for the
        // JS to be fully loaded when firing the turbolinks:load event.
        setTimeout(function() {
            let editor = new tui.Editor({
                el: document.querySelector('#tuiEditor'),
                initialEditType: 'markdown',
                previewStyle: 'tab',
                height: '500px',
                usageStatistics: false,
                initialValue: $('#blog_article_content').val(),
                exts: ['colorSyntax', 'table']
            });

            $('#blog_article_tags').flexdatalist({
                data: Routes.blog_tags_path({format: 'json'}),
                multiple: true,
                searchIn: 'name',
                visibleProperties: ['name', 'article_count']
            });

            $('form').on('submit', function () {
                $('#blog_article_content').val(editor.getMarkdown());
            });

            $('#submitButton').attr('disabled', false);
        }, 100);
    }
});
