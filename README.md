# README

## usersテーブル

|Column             |Type   |Options                   |
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|first_name         |string |null: false               |
|last_name          |string |null: false               |
|first_name_kana    |string |null: false               |
|last_name_kana     |string |null: false               |
|birthday           |date   |null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column                |Type       |Options                        |
|name                  |string     |null: false                    |
|description           |text       |null: false                    |
|price                 |integer    |null: false                    |
|user                  |references |null: false, foreign_key: true |
|category_id           |integer    |null: false                    |
|condition_id          |integer    |null: false                    |
|postage_payer_id      |integer    |null: false                    |
|prefecture_id         |integer    |null: false                    |
|ship_date_estimate_id |integer    |null: false                    |

### Association
- belongs_to: user
- has_one: order
- belongs_to_active_hash: category
- belongs_to_active_hash: condition
- belongs_to_active_hash: postage_payer
- belongs_to_active_hash: prefecture
- belongs_to_active_hash: ship_date_estimate

## ordersテーブル

|Column |Type      |Options                        |
|user   |references|null: false, foreign_key: true |
|item   |references|null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル

|Column        |Type      |Options                        |
|order         |references|null: false, foreign_key: true |
|postal_code   |string    |null: false                    |
|prefecture_id |integer   |null: false                    |
|city          |string    |null: false                    |
|address       |string    |                               |
|building_name |string    |null: false                    |
|phone_number  |string    |null: false                    |

### Association
- belongs_to: order
- belongs_to_active_hash: prefecture
