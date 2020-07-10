class Item< ActiveHash::Base

  # 
 
  # enum postage: {"着払い（購入者負担）":1, "送料込み（出品者負担）":2}
  # enum shipping_date: {"1~2日で発送":1,  "2〜3日で発送":2,"4〜7日で発送":3}
  # end

  

#   #空の投稿を保存できないようにする
#   validates :category, :status, :postage, :shpping_date, :prefecture, presence: true

#   #選択が「--」のままになっていないか
#   with_options numericality: { other_than: 1 } do
#   validates :item_id
#   end

#   belongs_to :address
#   has_one :item_purchase
#   belongs_to_active_hash :item_id
end  


r