class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  before_action :item, only: [:index, :create]
  before_action :sould_out

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_customer = PurchaseCustomer.new
  end

  def create
    @purchase_customer = PurchaseCustomer.new(purchase_params)
    if @purchase_customer.valid?
      pay_item
      @purchase_customer.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  def move_to_index
    @item = Item.find_by(id: params[:item_id])
    return unless @item && current_user.id == @item.user.id
    redirect_to root_path
  end

  def sould_out
    return unless @item && Purchase.exists?(item_id: @item.id)
    redirect_to root_path
  end

  private

  def purchase_params
    params.require(:purchase_customer).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def item
    @item = Item.find(params[:item_id])
  end
end
