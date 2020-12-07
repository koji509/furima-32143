class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers" }
    validates :nickname
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "full-width characters" }do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "full-width katakana characters" }do
    validates :first_name_kana
    validates :last_name_kana
  end
    validates :birthday, presence: true

  has_many :products
  has_many :purchases
end
