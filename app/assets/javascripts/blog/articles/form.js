$(document).on('turbolinks:load', function () {
    if ($('.blog_articles.new, .blog_articles.edit').length > 0) {
        let editor = new tui.Editor({
            el: document.querySelector('#tuiEditor'),
            initialEditType: 'markdown',
            previewStyle: 'tab',
            height: '500px',
            usageStatistics: false,
            initialValue: $('#blog_article_content').val(),
            exts: ['colorSyntax', 'table']
        });

        $('form').on('submit', function () {
            $('#blog_article_content').val(editor.getMarkdown());
        });

        $('#blog_article_tags').flexdatalist({
            data: Routes.blog_tags_path({ format: 'json' }),
            multiple: true,
            searchIn: 'name',
            visibleProperties: ['name', 'article_count']
        });
    }
});
