FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'信長'}
    last_name             {'織田'}
    first_name_kana       {'ノブナガ'}
    last_name_kana        {'オダ'}
    birthday               {'2011-03-09'}
  end
end
