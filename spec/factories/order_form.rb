FactoryBot.define do
  factory :order_form do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"123-1234"}
    prefecture_id {3}
    city          {"目黒区"}
    house_number  {"中目黒4-9-10"}
    building_name {"Saison Garden中目黒101"}
    phone_number  {"09012345678"}
    association :user
    association :item
  end
end
