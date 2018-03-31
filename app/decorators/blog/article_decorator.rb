# frozen_string_literal: true

module Blog
  class ArticleDecorator < BaseDecorator
    def link_to_author
      link_to author.email, view.user_path(author.id)
    end

    def published_date
      return t('blog.articles.article.unpublished') unless published_at
      l published_at, format: :long
    end

    def edit_button
      link_to icon('far', 'edit', t(:edit)),
              view.edit_blog_article_path(object),
              class: 'pure-button pure-button-block button-primary'
    end

    def delete_button
      link_to icon('far', 'trash-alt', t(:delete)),
              view.blog_article_path(object), method: :delete,
              class: 'pure-button pure-button-block button-danger mt-3',
              data: { confirm: t('blog.articles.article.confirm_delete') }
    end

    def publish_button
      return unpublish_button if published?
      form_with model: object, local: true do |f|
        f.button icon('far', 'paper-plane', t(:publish)),
                 name: 'blog_article[published_at]', value: Time.zone.now,
                 class: 'pure-button pure-button-block button-success mt-3',
                 data: { confirm: t('blog.articles.article.confirm_publish') }
      end
    end

    def unpublish_button
      form_with model: object, local: true do |f|
        f.button icon('fas', 'lock', t(:unpublish)),
                 name: 'blog_article[published_at]', value: nil,
                 class: 'pure-button pure-button-block button-danger mt-3',
                 data: { confirm: t('blog.articles.article.confirm_unpublish') }
      end
    end

    def render_content
      coderayified = CodeRayify.new(filter_html: true)
      opts = { fenced_code_blocks: true, lax_html_blocks: true, autolink: true,
               strikethrough: true, no_intra_emphasis: true, superscript: true }
      markdown_to_html = Redcarpet::Markdown.new(coderayified, opts)
      markdown_to_html.render(content).html_safe
    end
  end
end
