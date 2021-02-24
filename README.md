# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | integer| null: false |
| email               | integer| unique: true|
| encrypted_password  | integer| null: false |
| first_name          | integer| null: false |
| last_name           | integer| null: false |
| first_name_kana     | integer| null: false |
| last_name_kana      | integer| null: false |
| birth_date          | date   | null: false |

### Association

has_many :items
has_many :comments
has_many :order

## items テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| user_id           |references| null: false, foreign_key: true |
|  title            | string   | null: false                    |
|  image            |   ActiveStorageで実装                     |
| description       | text     | null: false                    |
| category_id       | integer  | null: false                    |
| condition_id      | integer  | null: false                    |
| delivery_change_id| integer  | null: false                    |
| delivery_days_id  | integer  | null: false                    |
| prefecture_id     | integer  | null: false                    |
| price             | integer  | null: false                    |

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
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code1     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| Building      | string     |                                |
| phone number  | integer    | null: false                    |

### Association

- belongs_to :order