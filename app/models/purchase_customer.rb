class PurchaseCustomer
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :street_address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: params[:item_id], user_id: current_user.id)
    Customer.create(post_code: post_code, prefecture: prefecture, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
    
end