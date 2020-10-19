module ArtworksHelper
  include Pagy::Frontend

  def column_css(column_name)
    return "text-light selected" if column_name.to_s == @order_by
    "text-light"
  end

  def arrow(column_name)
    return if column_name.to_s != @order_by
    @direction == "desc" ? "↑" : "↓"
  end

  def direction
    @direction == "asc" ? "desc" : "asc"
  end

  def pagy_get_params(params)
    params.merge query: @query, order_by: @order_by, direction: @direction
  end

  def prev_page
    @pagy.prev || 1
  end

  def next_page
    @pagy.next || @pagy.last
  end
end
