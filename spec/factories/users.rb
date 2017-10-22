FactoryGirl.define do
  factory :user do
    nickname              "Khorne"
    email                 "khorne@warp.com"
    password              "12345678"
    password_confirmation "12345678"
  end

  factory :invalid_user, class: 'User' do
    nickname ''
    email ''
    password '123456'
    password_confirmation '123456'
  end
end
