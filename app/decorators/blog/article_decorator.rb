module Blog
  class ArticleDecorator < BaseDecorator
    def render_content
      coderayified = CodeRayify.new(filter_html: true)
      opts = { fenced_code_blocks: true, lax_html_blocks: true, autolink: true,
               strikethrough: true, no_intra_emphasis: true, superscript: true }
      markdown_to_html = Redcarpet::Markdown.new(coderayified, opts)
      markdown_to_html.render(content).html_safe
    end
  end
end
