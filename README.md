# テーブル設計

## users テーブル

| Column                | Type    | Options                 |
| --------------------- | ------- | ----------------------- |
| nickname              | string  | null:false              |
| email                 | string  | null:false unique: true |
| encrypted_password    | string  | null:false              |
| family_name           | string  | null:false              |
| first_name            | string  | null:false              |
| family_name_kana      | string  | null:false              |
| first_name_kana       | string  | null:false              |
| birth_day             | date    | null:false              |

### Association

- has_many :items
- has_many :destinations

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null:false                    |
| price         | integer    | null:false                    |
| description   | text       | null:false                    |
| category_id   | integer    | null:false                    |
| status_id     | integer    | null:false                    |
| cost_id       | integer    | null:false                    |
| day_id        | integer    | null:false                    |
| prefecture_id | integer    | null:false                    |
| user_id       | integer    | null:false foreign_key :true  |

### Association

- belongs_to :user
- belongs_to :destination

## destinations テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| item_id            | integer    | null:false foreign_key :true |
| user_id            | integer    | null:false foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| zip_code       | string     | null:false                   |
| prefecture_id  | integer    | null:false                   |
| city           | string     | null:false                   |
| adress         | string     | null:false                   |
| building_name  | string     |                              |
| phone_number   | string     | null:false                   |
| destination_id | integer    | null:false foreign_key :true |

### Association

- belongs_to :destination
