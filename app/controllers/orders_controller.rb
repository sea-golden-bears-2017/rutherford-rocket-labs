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
    warehouses = Warehouse.all
    @warehouse_options = warehouses.map { |warehouse| [warehouse.location, warehouse.id] }

  end

  def create
    warehouse = Warehouse.find(params[:order][:warehouse].to_i)
    @order = Order.create(warehouse: warehouse)

    redirect_to new_order_orders_part_path(@order)
  end
end
