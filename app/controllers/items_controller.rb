class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_user_id, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :sould_out, only: [:edit]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def move_to_index
    return if current_user.id == @item.user.id

    redirect_to action: :index
  end

  def sould_out
    return unless @item && Purchase.exists?(item_id: @item.id)

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :quality_id, :delivery_cost_id, :prefecture_id,
                                 :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_user_id
    @item = Item.find(params[:id])
  end
end
