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
-has_one :profile

items table
|Column|Type|Options|
|------|----|-------|
|img|references|null: false|
|name|string|null: false|
|info|text|null: false|
|category|references|null: false|
|status|references|null: false|
|price|integer|null: false|
|price_tax|integer|null: false|
|category|integer|null: false|
|brand|references|null: false|
|user|references|null: false, foreign_key: true|

Association
-belongs_to :user

address table
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture|references|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-------|
|phone_number|integer|unique: true|
|user|references|null: false, foreign_key: true|

Association
-belongs_to :user

