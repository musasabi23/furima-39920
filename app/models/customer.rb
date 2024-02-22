class Customer < ApplicationRecord
  belongs_to :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  #with_options presence: true do
    #validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    #validates :city
    #validates :street_address
    #validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  #end
  #validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
