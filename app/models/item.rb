class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_duration


  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :quality_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :delivery_cost_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_duration_id, numericality: { other_than: 0 , message: "can't be blank"}

  end


end
