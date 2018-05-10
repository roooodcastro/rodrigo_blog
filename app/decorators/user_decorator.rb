# frozen_string_literal: true

class UserDecorator < BaseDecorator
  def articles
    @articles ||= object.articles.order_by_recents.map { |a| a.decorate(view) }
  end

  def formatted_admin?
    t(object.admin? ? :y : :n)
  end

  def formatted_poster?
    t(object.poster? ? :y : :n)
  end

  def edit_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'edit', t(:edit)),
            view.edit_user_path(object),
            class: "pure-button #{class_block} button-primary"
  end

  def delete_button(block = false)
    return disabled_delete_button(block) unless policy(object).destroy?
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'trash-alt', t(:delete)),
            view.user_path(object), method: :delete,
            class: "pure-button #{class_block} button-danger",
            data: { confirm: t('users.confirm_delete') }
  end

  def disabled_delete_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'trash-alt', t(:delete)),
            '#', class: "pure-button #{class_block} button-danger",
            disabled: true
  end
end
