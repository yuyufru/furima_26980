class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_one :item_purchase


  # def show_sold_out_item(item)
  #   if (sold_out_item).present?
  #     'Sold Out!!'
  #   end
  # end

end  


