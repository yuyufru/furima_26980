class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :address
  has_many :item_purchases
  validates :password, presence: true, length: { maximum: 8 }
  # validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
end

def new
  @user = Users.new
end  
