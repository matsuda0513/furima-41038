# README

## usersテーブル

|Column             |Type   |Options                   |
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|first_name         |string |null: false               |
|last_name          |string |null: false               |
|first_name_kana    |string |null: false               |
|birthday           |date   |null: false               |

### Association
- has_many :items, orders

## itemsテーブル

|Column            |Type      |Options                        |
|name              |string    |null: false                    |
|description       |text      |null: false                    |
|price             |decimal   |null: false                    |
|user_id           |references|null: false, foreign_key: true |
|category          |string    |null: false                    |
|condition         |string    |null: false                    |
|postage_payer     |string    |null: false                    |
|ship_from_region  |string    |null: false                    |
|ship_date_estimate|string    |null: false                    |

### Association
- belongs_to: user, order

## ordersテーブル

|Column |Type      |Options                        |
|user_id|references|null: false, foreign_key: true |
|item_id|references|null: false, foreign_key: true |

### Association
- belongs_to: user, item
- has_one: shipping

## shippingテーブル

|Column       |Type      |Options                        |
|order_id     |references|null: false, foreign_key: true |
|postal_code  |string    |null: false                    |
|prefecture   |string    |null: false                    |
|city         |string    |null: false                    |
|address      |string    |null: false                    |
|building_name|string    |null: false                    |
|phone_number |string    |null: false                    |

### Association
- belongs_to: order
