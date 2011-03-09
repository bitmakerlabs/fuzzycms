module ApplicationHelper

  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output
  end

  def pages_nav
    pages = Page.all
    result = []
    pages.each do |p|
      result << link_to(p.title, p)
    end

    result.join(" ")
  end
end
