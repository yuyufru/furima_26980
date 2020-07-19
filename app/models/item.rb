class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  with_options presence: true do
    validates :name
    validates :info
    validates :category
    validates :status
    validates :price
    validates :postage
    validates :shipping_date
    validates :prefecture
    validates :user_id  
  end
end



