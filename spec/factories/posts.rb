FactoryGirl.define do
  factory :post do
    title "MyTitle"
    body "MyBody"
    published_at DateTime.now
    association(:author)
  end
end
