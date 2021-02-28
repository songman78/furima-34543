class ItemsController < ApplicationController
  def index
  end

  def new
    # @item = Item.new
  end

  def create
  end

private
 def item_params
  params.require(:item).permit(:user,:title,:description,:category_id,:condition_id,:delivery_change_id,:delivery_days_id,:prefecture_id,:price)
 end
end
