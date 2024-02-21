FactoryBot.define do
  factory :item do
    name                   { 'test商品名' }
    description            { 'test説明' }
    category_id            { '1' }
    quality_id             { '1' }
    delivery_cost_id       { '1' }
    prefecture_id          { '1' }
    shipping_duration_id   { '1' }
    price                  { '3000' }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test11.png'), filename: 'test11.png')
    end
  end
end
