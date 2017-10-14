module ApplicationHelper
    def form_group_tag(errors, &block)
        css_class = 'form-group'
        css_class << ' has-error' if errors.any?
        content_tag :div, capture(&block), class: css_class
    end

    def to_markdown(text)
    	renderer = Redcarpet::Render::HTML.new({
    		escape_html: true,
    		prettify: true,
    		safe_links_only: true
    		})
    	markdown = Redcarpet::Markdown.new(renderer, {
    		strikethrough: true,
    		underline: true, 
    		highlight: true,
    		quote: true
    		})
    	markdown.render(text).html_safe
    end
end
