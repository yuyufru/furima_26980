class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :address
  has_many :item_purchases
  # validates :password, length: { maximum: 6 }
  # validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :first_name,:last_name,:last_name_kana,:first_name_kana,:birth_day ,presence: true
end

def new
  @user = Users.new
end  
