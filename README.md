# テーブル設計

## users テーブル

| Column           | Type    | Options    |
| ---------------- | ------- | ---------- |
| nickname         | string  | null:false |
| email            | string  | null:false |
| user_password    | string  | null:false |
| family_name      | text    | null:false |
| first_name       | text    | null:false |
| family_name_kana | text    | null:false |
| first_name_kana  | string  | null:false |
| birth_year       | date    | null:false |
| birth_month      | date    | null:false |
| birth_day        | date    | null:false |


### Association

- has_many :products
- belongs_to :destination

## products テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null:false                    |
| image         | string     | null:false                    |
| price         | string     | null:false                    |
| description   | string     | null:false                    |
| category      | string     | null:false                    |
| status        | string     | null:false                    |
| cost          | string     | null:false                    |
| day           | string     | null:false                    |
| prefecture_id | string     | null:false                    |
| user_id       | integer    | null:false foreign_key :true  |

### Association

- belongs_to :users

## destinations テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| family_name      | text       | null:false                   |
| first_name       | text       | null:false                   |
| family_name_kana | text       | null:false                   |
| first_name_kana  | string     | null:false                   |
| user_id          | integer    | null:false foreign_key :true |

### Association

- belongs_to :users
- has_one :shipping_addresses

## shipping_addresses テーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| zip_code      | string     | null:false                   |
| prefecture_id | string     | null:false                   |
| city          | string     | null:false                   |
| adress        | string     | null:false                   |
| building_name | string     |                              |
| phone_number  | string     | null:false                   |
| user_id       | references | null:false foreign_key :true |

### Association

- belongs_to :destinations
