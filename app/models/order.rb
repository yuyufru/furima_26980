class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :house_number
    validates :phone_number
    validates :price
  end
end
