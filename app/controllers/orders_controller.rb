class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
   
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = Order.new(order_params)
    Address.create(address_params)
    if @order_address.valid?
      @order_address.save
     redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:item_id, :user_id,:zip_code1, :prefecture_id, :city, :address, :building, :phone_number, :order)
    # .merge(order_id: @order.id)
  end
end
