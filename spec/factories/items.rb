FactoryBot.define do
  factory :item do
    product_name {"test"}
    explanation  {"test,とても良い商品です,test"}
    category_id  {"3"}
    status_id    {"3"}
    delivery_id  {"3"}
    area_id      {"3"}
    day_id       {"3"}
    price        {"15151"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end