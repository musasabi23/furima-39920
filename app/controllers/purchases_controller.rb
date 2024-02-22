class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_costomer = PurchaseCustomer.new
  end

  def create
    @purchase_costomer = PurchaseCustomer.new(purchase_params)
    if @purchase_costomer.valid?
      @purchase_costomer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:post_code, :prefecture, :city, :street_address, :building_name, :phone_number).merge(purchase_id: purchase_id, item_id: item_id, user_id: current_user.id)
  end

end
