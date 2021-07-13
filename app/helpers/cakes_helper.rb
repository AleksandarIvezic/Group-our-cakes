module CakesHelper
  def asc_dot
    content_tag :div, '', class: 'dot' if params[:order] == 'asc'
  end

  def desc_dot
    content_tag :div, '', class: 'dot' if params[:order] == 'desc'
  end

  def category_img(cake)
    if cake.groups.first
      cake.groups.first.icon
    else
      "uncategorized/uncategorized.jpeg"
    end
  end
end
