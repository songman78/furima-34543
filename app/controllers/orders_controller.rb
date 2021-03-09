class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new, :create]
  before_action :set_item, only: [:index,:create]
  before_action :check_current_user, only: [:index,:new,:create]
  before_action :check_sold_out, only: [:index,:new,:create]

  def index
    @order_address = OrderAddress.new
  end
  
  def new
  end

  def create
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
    params.require(:order_address).permit(:zip_code1,:prefecture_id, :city, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key =ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],   
      currency: 'jpy'               
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_current_user
    if  current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def check_sold_out
    if  @item.order.present?
    redirect_to root_path
    end
  end

end
