class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :myouji_kanji,       presence: true
  validates :namae_kanji,        presence: true
  validates :myouji_katakana,    presence: true
  validates :namae_katakana,    presence: true
  validates :seinenngappi,       presence: true
end
