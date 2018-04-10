class ReplyForm {
    constructor(commentableId, commentUnit) {
        this.commentableId = commentableId;
        this.commentUnit = commentUnit;
    }

    show() {
        if (this.formElement == null) {
            this.copyFormElement();
        }
        $(this.formElement).show();
        this.formElement.querySelector('#comment_body').focus();
    }

    copyFormElement() {
        let originalForm = document.querySelector('#comment_reply_form');
        let newForm = originalForm.cloneNode(true);
        let typeInput = newForm.querySelector('#comment_commentable_type');
        let idInput = newForm.querySelector('#comment_commentable_id');

        newForm.id = 'comment_reply_' + this.commentableId;
        typeInput.value = 'Blog::Comment';
        idInput.value = this.commentableId;
        newForm.style.display = 'block';

        this.formElement = newForm;
        this.commentUnit.parentNode.insertBefore(newForm,
            this.commentUnit.nextSibling);
    }
}
