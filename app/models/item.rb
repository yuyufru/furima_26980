class Item < ApplicationRecord

  belongs_to :address
  has_one :item_purchase

end
