class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
   
  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :user_id)
  end

  def address_params
    params.permit(:zip_code1, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  end
end
