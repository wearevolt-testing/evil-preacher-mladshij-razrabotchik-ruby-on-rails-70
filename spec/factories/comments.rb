FactoryGirl.define do
  factory :comment do
    body "MyComment"
    association(:author)
    association(:post)
  end
end
