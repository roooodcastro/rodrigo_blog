# frozen_string_literal: true

class ArticleDecorator < BaseDecorator
  def link_to_author
    link_to author_name, view.user_path(author.id)
  end

  def published_date
    return t('articles.article.unpublished') unless published_at
    l published_at.to_date, format: :long
  end

  def edit_button(block = false)
    class_block = block ? 'pure-button-block' : ''
    link_to icon('far', 'edit', t(:edit)),
            view.edit_article_path(object),
            class: "pure-button #{class_block} button-primary"
  end

  def delete_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    link_to icon('far', 'trash-alt', t(:delete)),
            view.article_path(object), method: :delete,
            class: "pure-button #{class_block} button-danger",
            data: { confirm: t('articles.article.confirm_delete') }
  end

  def publish_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    return unpublish_button(block) if published?
    update_form(block) do |f|
      f.button icon('far', 'paper-plane', t(:publish)),
               name: 'article[published_at]', value: Time.zone.now,
               class: "pure-button #{class_block} button-success",
               data: { confirm: t('articles.article.confirm_publish') }
    end
  end

  def unpublish_button(block = false)
    class_block = block ? 'pure-button-block mt-3' : ''
    update_form(block) do |f|
      f.button icon('fas', 'lock', t(:unpublish)),
               name: 'article[published_at]', value: nil,
               class: "pure-button #{class_block} button-danger",
               data: { confirm: t('articles.article.confirm_unpublish') }
    end
  end

  def render_content
    coderayified = CodeRayify.new(filter_html: true)
    opts = { fenced_code_blocks: true, lax_html_blocks: true, autolink: true,
             strikethrough: true, no_intra_emphasis: true, superscript: true }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, opts)
    markdown_to_html.render(content).html_safe
  end

  def update_form(block = true)
    form_with model: object, local: true,
              html: { class: block ? '' : 'form-inline' } do |f|
      yield(f)
    end
  end

  def encoded_url
    URI.encode view.article_url(object.slug)
  end

  def encoded_title
    URI.encode object.title
  end

  def encoded_summary
    URI.encode object.summary
  end

  def encoded_email_body
    text = [object.summary, t('articles.article.email_body',
                              url: view.article_url(object.slug))]
    URI.encode(text.join("\n\n"))
  end

  def all_comments
    @comments ||= object.comments.order_by_recents.with_second_level_replies
  end
end
