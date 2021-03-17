class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :destinations

  with_options presence: true do
    validates :nickname, presence: true
    # ひらがな、カタカナ、漢字のみ許可する
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birth_day, presence: true
  end
end
