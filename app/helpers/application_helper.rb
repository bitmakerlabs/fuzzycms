module ApplicationHelper

  def pages_nav
    pages = Page.all
    result = []
    pages.each do |p|
      result << link_to(p.title, p)
    end

    result.join(" ")
  end
end
