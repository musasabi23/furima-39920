class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_customer = PurchaseCustomer.new

  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_customer = PurchaseCustomer.new(purchase_params)
    if @purchase_customer.valid?
      @purchase_customer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_customer).permit(:post_code, :prefecture, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
