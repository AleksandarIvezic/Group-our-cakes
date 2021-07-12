module CakesHelper
  def asc_dot
    content_tag :div, '', class: 'dot' if params[:order] == 'asc'
  end

  def desc_dot
    content_tag :div, '', class: 'dot' if params[:order] == 'desc'
  end
end
