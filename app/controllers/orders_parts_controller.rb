class OrdersPartsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
  end

  def create
    @errors = []
    order = Order.find(params[:order_id])
    part_id = params[:orders_part][:part_id]
    quantity = params[:orders_part][:quantity]

    if part_id == ""
      @errors << "Must enter a part number"
    end
    if quantity == ""
      @errors << "Must enter a quantity"
    end
    if !Part.exists?(part_id)
      @errors << "Could not find part with id #{part_id}"
    end

    if @errors.empty?
      part = Part.find(part_id)
      quantity = quantity.to_i
      @orders_part = OrdersPart.create(order: order, part: part, quantity_ordered: quantity)
      redirect_to order_path(order)
    else
      render 'new', locals: { '@order': order }
    end
  end

end
