class OrdersController < ApplicationController
  def index
    # @order = Order.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
    @order_address.save
     redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_address).permit(:zip_code1,:prefecture_id, :city, :address, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: @item.id)
  end
end
