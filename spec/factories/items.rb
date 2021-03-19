FactoryBot.define do
  factory :item do
    name {"サンプル"}
    price {10000}
    description {"サンプル説明"}
    category_id {2}
    status_id {2}
    cost_id {2}
    day_id {2}
    prefecture_id {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
