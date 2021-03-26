FactoryBot.define do
  factory :destination_shipping_address do
    zip_code {"123-4567"}
    prefecture_id {1}
    city{"東京都"}
    adress{"1-1"}
    building_name{"東京ハイツ"}
    phone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    item_id {1}
    user_id {1}
  end
end
