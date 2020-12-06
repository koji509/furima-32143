FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"aaa111"}
    password_confirmation {password}
    first_name            {"隆"}
    last_name             {"佐藤"}
    first_name_kana       {"タカシ"}
    last_name_kana        {"サトウ"}
    birthday              {"1980-02-09"}
  end
end