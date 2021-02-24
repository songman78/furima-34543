# テーブル設計

## users テーブル

| Column              | Type   | Options                 |
| ------------------- | ------ | ----------------------- |
| nickname            | string | null: false             |
| email               | string | unique: true,null: false|
| encrypted_password  | string | null: false             |
| first_name          | string | null: false             |
| last_name           | string | null: false             |
| first_name_kana     | string | null: false             |
| last_name_kana      | string | null: false             |
| birth_date          | date   | null: false             |

### Association

has_many :items
has_many :orders

## items テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| user              |references| null: false, foreign_key: true |
| title             | string   | null: false                    |
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
| zip_code1     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         |references  | null: false, foreign_key: true |


### Association

- belongs_to :order