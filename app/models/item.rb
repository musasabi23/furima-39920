class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  end


end
