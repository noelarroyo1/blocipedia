module ApplicationHelper
  def markdown(text)
    options = {filter_html: true, hard_wrap: true, space_after_headers: true, fenced_code_blocks: true, prettify: true}
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end
end
