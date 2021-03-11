class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
  validates :nickname
  validates :myouji_kanji ,format:{with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :namae_kanji ,format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :myouji_katakana,format:{with: /\A[ァ-ヶー－]+\z/}
  validates :namae_katakana,format:{with: /\A[ァ-ヶー－]+\z/}
  validates :seinenngappi
  end
  
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,1000}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
            message: "は半角6~1000文字英小文字・数字それぞれ１文字以上含む必要があります"}
end


