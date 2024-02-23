FactoryBot.define do
  factory :purchase_customer do
    post_code        { '123-4567' }
    prefecture_id    { '1' }
    city             { '東京' }
    street_address   { '番地' }
    building_name    { 'ビル名' }
    phone_number     { '1234567899' }
    user_id          { '1' }
    item_id          { '1' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
