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
      update.quantity = update.quantity - value.to_i
      update.save
    end
    redirect_to  warehouse_path(@warehouse)
  end
end
