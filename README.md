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

>>>>>>>>>>>>>>>>>>>>>


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname          | string | null: false |
| encrypted_password| string | null: false |
| email             | string | null: false | unique: true |
| myouji_kanji      | string | null: false |
| namae_kanji       | string | null: false |
| myouji_katakana   | string | null: false |
| namae_katakana    | string | null: false |
| seinenngappi      | date   | null: false |




////Association////

- has_many :items
- has_many :purchases

## addresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal-code       | string | null: false |
| address1_id       | integer| null: false |
| shikucyouson      | string | null: false |
| bannchi           | string | null: false |
| tatemonomei       | string |
| phone-number      | string | null: false |
| purchase          | references | null: false, foreign_key: true |


////Association////

- belongs_to :purchase


## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price           |integer    | null: false |
| user            | reference |null: false, foreign_key: true |
| item            | string    | null: false |
| explanation     | text      | null: false |
| category_id     | integer   | null: false |
| status_id       | integer   | null: false |
| fee_id          | integer   | null: false |
| address1_id     | integer   | null: false |
| days_required_id| integer   | null: false |


////Association////

- has_one    :purchase
- belongs_to :user



## purchases テーブル


| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

////Association////

- belongs_to :item
- belongs_to :user
- has_one    :address