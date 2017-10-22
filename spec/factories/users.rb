FactoryGirl.define do
  factory :user do
    nickname              "Khorne"
    email                 "khorne@warp.com"
    password              "12345678"
    password_confirmation "12345678"
  end
end
