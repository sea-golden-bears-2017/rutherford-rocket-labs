class PartsController < ApplicationController
  def index
    @parts = Part.all
  end

  def new
  end
end
