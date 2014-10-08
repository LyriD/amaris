module ApplicationHelper

  def cl_helper(category)
    cl_helper = case category.id
        when 1 then 'mass'
        when 2 then 'corp'
        when 3 then 'bus'
     end
    cl_helper
end

  def garamond_menu

    # Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self).to_html

    # presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
    # presenter.dom_id = 'menu'
    # presenter.css = 'menu clearfix'
    # presenter.menu_tag = :nav
    # presenter.list_tag = :ul
    # presenter.list_item_tag = :li
    # presenter.selected_css = :selected
    # presenter.first_css = :first
    # presenter.last_css = :last
    # presenter.max_depth = 0
    # presenter.to_html


    collection = refinery_menu_pages

    render_menu_items2(collection.roots)


  end


  def render_menu_items2(menu_items)
    if menu_items.present?
      # content_tag(list_tag) do
      menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
        buffer << render_menu_item(item, index)
      end
      # end
    end
  end

  def render_menu_item(menu_item, index)
    content_tag(:li, :class => menu_item_css(menu_item, index)) do
      buffer = ActiveSupport::SafeBuffer.new
      buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
      buffer << render_menu_items(menu_item_children(menu_item))
      buffer
    end
  end

  def menu_item_css(menu_item, index)
    css = []

    css << selected_css if selected_item_or_descendant_item_selected?(menu_item)
    css << first_css if index == 0
    css << last_css if index == menu_item.shown_siblings.length

    css.reject(&:blank?).presence
  end


end
