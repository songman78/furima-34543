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
   pay_item
    @order_address.save
     redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zip_code1,:prefecture_id, :city, :address, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key =ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],   
      currency: 'jpy'               
    )
  end
end
