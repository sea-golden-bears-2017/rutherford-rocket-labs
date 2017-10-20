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

private
  def part_params
      params.require(:part).permit(:name, :min, :max)
  end
end
