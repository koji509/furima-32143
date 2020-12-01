# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nickname   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| birthday   | date   | null: false               |

### Association
- has_many :products
- has_many :purchases

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery     | integer    | null: false                    |
| area         | string     | null: false                    |
| days         | date       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ |----------- |------------------------------- |
| postal_code  | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| house_number | integer    | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| product      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| purchase | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
