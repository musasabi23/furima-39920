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
    validates :name
    validates :description

    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :quality_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_duration_id, numericality: { other_than: 1 , message: "can't be blank"}

  end


end
