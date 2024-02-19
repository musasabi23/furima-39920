class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def message_params
    params.require(:item).permit(:name, :description, :category_id, :quality_id, :delivery_cost_id, :prefecture_id, :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end

end
