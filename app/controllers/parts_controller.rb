class PartsController < ApplicationController
  def index
    @parts = Part.all
  end

  def new
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to parts_path
    else
      render new_part_path
    end

  end

private
  def part_params
      params.require(:part).permit(:name, :min, :max)
  end
end
