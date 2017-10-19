class OrdersPartsController < ApplicationController
  def update
    @orderpart = OrdersPart.find(params[:id])
    @orderpart.quantity_received = params[:quantity_received]
    @orderpart.save
    render :'orders/show'
  end
end
