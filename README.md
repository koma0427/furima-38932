# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Tabel名
## users テーブル
| Column                 | Type       | Options                  |
| -----------------------| ---------- | -------------------------|
| nickname               | string     | null: false,unique: true |
| mail                   | string     | null: false,unique: true |
| password               | string     | null: false,unique: true |
| password_confirmation  | string     | null: false,unique: true |
| last_name              | string     | null: false              |
| first_name             | string     | null: false              |
| last_name_kana         | string     | null: false              |
| first_name_kana        | string     | null: false              |
| birth_date             | date       | null: false              |


### Association
- has_many :items
- has_many :purchases


## purchases テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| name   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## items テーブル
| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| delivery_burden     | integer    | null: false                    |
| delivery_sarea      | integer    | null: false                    |
| birth_date          | integer    | null: false                    |
| selling_price       | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase


## delivery_addresses テーブル
| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| purchases      | references | null: false, foreign_key: true |
| postcode       | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchases_id   | string     | null: false                    |

### Association
- belongs_to :purchase