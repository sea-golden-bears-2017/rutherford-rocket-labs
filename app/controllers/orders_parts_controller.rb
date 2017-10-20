class OrdersPartsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    order = Order.find(params[:order_id])
    part = Part.find(params[:orders_part][:part_id])
    quantity = params[:orders_part][:quantity].to_i
    @orders_part = OrdersPart.create(order: order, part: part, quantity_ordered: quantity)
    redirect_to new_order_orders_part_path
  end

end
