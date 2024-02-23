class CustomersController < ApplicationController
  private

  def item_params
    params.require(:customer).permit(:post_code, :prefecture_id, :city, :street_address, :building_name,
                                     :phone_number).merge(purchase_id:)
  end
end
