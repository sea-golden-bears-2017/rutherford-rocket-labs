class WarehousesController < ApplicationController
  def index
    redirect_to new_session_path if !session[:user_id]
    @warehouses = Warehouse.all
  end

  def show
    redirect_to new_session_path if !session[:user_id]
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    params[:location_part].each do |key,value|
      @warehouse = Warehouse.find(key)
      update = PartsWarehouse.find_by(part: @part, warehouse: @warehouse)

      if update.quantity < value.to_i
        @errors = ['Quantity requested cannot be greater than the current quantity.']
      elsif value.to_i < 1
        @errors = ['Quantity requested must be more than 1']
      else
        update.quantity = update.quantity - value.to_i
        update.save
      end
    end
    if @errors
      render :show
    else
      redirect_to  warehouse_path(@warehouse)
    end
  end
end
