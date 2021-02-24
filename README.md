# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday_yyyy_id    | integer| null: false |
| birthday_mm_id      | integer| null: false |
| birthday_dd_id      | integer| null: false |

### Association

has_many :items
has_many :comments
has_many :order

## items テーブル

| Column         | Type     | Options                        |
| -------------- | -------- | ------------------------------ |
| user_id        |references| null: false, foreign_key: true |
|  title         | string   | null: false                    |
|  image         |   ActiveStorageで実装                     |
| description    | text     | null: false                    |
| category       | string   | null: false                    |
|  condition     | string   | null: false                    |
|delivery_change | string   | null: false                    |
|delivery_days   | string   | null: false                    |
| prefecture     | string   | null: false                    |
| price          | integer  | null: false                    |

### Association
- belongs_to :user
- has_one :order
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## order テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| address_id   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code1     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| Building      | string     |                                |
| phone number  | string     | null: false                    |

### Association

- belongs_to :order