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
      if update.quantity >= value.to_i
        update.quantity = update.quantity - value.to_i
        update.save
      else
        @errors = ['Quantity requested cannot be greater than the current quantity.']
      end
    end
    if @errors
      render :show
    else
      redirect_to  warehouse_path(@warehouse)
    end
  end
end
