FactoryGirl.define do
  factory :post do
    title "MyTitle"
    body "MyBody"
    published_at DateTime.now
  end
end
