class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orderpart = OrdersPart.new()
  end

  def update
    p params
    @order = Order.find(params[:id])
    params[:part_id].each do |key, value|
      orderpart = OrdersPart.find(key)
      orderpart.quantity_received = value
      orderpart.save
    end
    @order.submitted = true
    @order.processed = true
    render :show
  end
end
