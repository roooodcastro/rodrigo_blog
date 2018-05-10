$(document).on('turbolinks:load', function () {
    if ($('.blog-comments-title').length > 0) {
        let comments = $('.blog-comment-unit');
        let commentForms = {};

        // Initialize all reply forms in a hash map, so we can just show it
        // later and reuse them.
        comments.each(function() {
            let commentId = $(this).data('id');
            commentForms[commentId] = new ReplyForm(commentId, this);
        });

        $(document).on('click', '.blog-comment-cancel', function(ev) {
            $(this).closest('.blog-comment-form').hide();
            ev.preventDefault();
        });

        $(document).on('click', '.blog-comment-reply_button', function(ev) {
            let replyButton = $(this);
            let form = commentForms[replyButton.data('id')];
            form.show();
            ev.preventDefault();
        })
    }
});
