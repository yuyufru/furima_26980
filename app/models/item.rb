class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_one :item_purchase
 
  # belongs_to_active_hash :item_id
end  


