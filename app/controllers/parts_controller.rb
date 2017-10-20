class PartsController < ApplicationController
  def index
    @parts = Part.all
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to parts_path
    else
      render 'new'
    end
  end
  def show
    @part = Part.find(params[:id])
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
    render :'show'
  end

private
  def part_params
      params.require(:part).permit(:name, :min, :max)
  end
end
