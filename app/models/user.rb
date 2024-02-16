class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    # 半角英字数字のみ許可する
    validates :birthday, format: {with: /\A\d{4}[-]\d{2}[-]\d{2}\z/, message: "is invalid. Input half-width characters."}
  end
  validates :password, format: {with: /\A(?=.*[a-zA-Z])(?=.*\d).{6,}\z/, message: "is invalid. Include both letters and numbers."}
end
