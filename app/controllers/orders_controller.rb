class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    params[:part_id].each do |key, value|
      orderpart = OrdersPart.find(key)
      orderpart.quantity_received = value
      orderpart.save
    end
    @order.submitted = true
    @order.processed = true
    @order.save

    render :show
  end

  def new
    @order = Order.new
  end
end
