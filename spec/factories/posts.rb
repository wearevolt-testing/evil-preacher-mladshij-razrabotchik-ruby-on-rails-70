FactoryGirl.define do
  factory :post do
    title "MyTitle"
    body "MyBody"
    published_at DateTime.now
    association(:author)
  end

  factory :invalid_post, class: 'Post' do
    title ""
    body ""
    published_at DateTime.now
    association(:author)
  end
end
