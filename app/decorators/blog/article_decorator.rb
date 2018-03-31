module Blog
  class ArticleDecorator < BaseDecorator
    def link_to_author
      link_to author.email, view.user_path(author.id)
    end

    def published_date
      return 'UNPUBLISHED' unless published_at
      view.l published_at, format: :long
    end

    def publish_button
      return if published?
      form_with model: object, local: true do |f|
        f.button 'Publish', name: 'blog_article[published_at]',
                 value: Time.zone.now
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
