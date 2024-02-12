# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | integer | null: false               |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                  |
| ----------------- | ---------- | ------------------------ |
| item              | string     | null: false              |
| description       | text       | null: false              |
| category          | string     | null: false              |
| quality           | string     | null: false              |
| delivery_cost     | string     | null: false              |
| from              | string     | null: false              |
| shipping_duration | string     | null: false              |
| price             | integer    | null: false              |
| user              | references | false, foreign_key: true |

### Association

- has_one :purchases
- belongs_to :users

## purchases テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :customers

## customers テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases