module TitleHelper
  def title(title)
    content_for(:title, title)
    content_tag(:h1, title, class: 'page-title')
  end
end
