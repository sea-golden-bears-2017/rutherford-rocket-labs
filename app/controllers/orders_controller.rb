class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    submitted = params[:order][:submitted] if params[:order]
    user = User.find(session[:user_id])

    if submitted == "true"
      @order.submitted = true
      @order.save
    elsif params[:part_id]
      @order.processor = user
      params[:part_id].each do |key, value|
        orderpart = OrdersPart.find(key)
        orderpart.quantity_received = value
        orderpart.save
      end
      @order.processed = true
      @order.save
    end

    redirect_to order_path(@order)
  end

  def new
    warehouses = Warehouse.all
    @warehouse_options = warehouses.map { |warehouse| [warehouse.location, warehouse.id] }

  end

  def create
    warehouse = Warehouse.find(params[:order][:warehouse].to_i)
    @order = Order.create(warehouse: warehouse, creator: User.find(session[:user_id]))


    redirect_to new_order_orders_part_path(@order)
  end
end
