class Item < ApplicationRecord
  has_one_attached :image

#   #空の投稿を保存できないようにする
#   validates :category, :status, :postage, :shpping_date, :prefecture, presence: true

#   #選択が「--」のままになっていないか
#   with_options numericality: { other_than: 1 } do
#   validates :item_id
#   end

  # belongs_to :address
  # has_one :item_purchase
  # belongs_to_active_hash :item_id
end  


