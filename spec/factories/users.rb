FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    password_confirmation {password}
    first_name            {"隆"}
    last_name             {"佐藤"}
    first_name_kana       {"タカシ"}
    last_name_kana        {"サトウ"}
    birthday              {"1980-02-09"}
  end
end