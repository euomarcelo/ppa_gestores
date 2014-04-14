module ApplicationHelper
  def glypho(*names)
    content_tag :i, nil, class: names.map{|name| "fa fa-#{name.to_s.gsub('_','-')}" }
  end
  
  def menu_header
    menu_items = Refinery::Menu.new(Refinery::Page.menu_pages)
    presenter = Refinery::Pages::MenuPresenter.new(menu_items, self)
    presenter.first_css = nil
    presenter.last_css = nil
    presenter
  end

  
  
end