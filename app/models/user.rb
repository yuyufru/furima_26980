class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :address
  has_many :item_purchases
  validates :password, length: { minimum: 6 }
  # validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :first_name,:last_name,:last_name_kana,:first_name_kana,:birth_day ,presence: true

  with_options presence: true do
    validates :first_name,:last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :last_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
  end

# def new
#   @user = Users.new
# end  
end

