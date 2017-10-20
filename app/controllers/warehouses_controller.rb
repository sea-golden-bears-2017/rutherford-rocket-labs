class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
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
