class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    elsif
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:user, :image, :title, :description, :category_id, :condition_id, :delivery_change_id,:delivery_days_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end