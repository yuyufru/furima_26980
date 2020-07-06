users  table
|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique: true, index:true|
|password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_day|integer|null: false|

Association
-has_many :items
-has_one :address
-has_many :item_purchases

items table
|Column|Type|Options|
|------|----|-------|
|img|text|null: false|
|name|string|null: false|
|info|text|null: false|
|category|integer|null: false|
|status|integer|null: false|
|price|integer|null: false|
|price_tax|integer|null: false|
|brand|integer|null: false|
|user|references|null: false, foreign_key: true|

Association
-belongs_to :address
-has_one:item_purchase

addresses table
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-------|
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|

Association
-belongs_to :user

item_purchases　table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|

Association
-belongs_to :user
-belongs_to :item