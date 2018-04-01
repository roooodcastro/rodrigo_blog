class UserDecorator < BaseDecorator
  def edit_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'edit', t(:edit)),
            view.edit_user_path(object),
            class: "pure-button #{class_block} button-primary"
  end

  def delete_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'trash-alt', t(:delete)),
            view.user_path(object), method: :delete,
            class: "pure-button #{class_block} button-danger",
            data: { confirm: t('users.confirm_delete') }
  end
end
