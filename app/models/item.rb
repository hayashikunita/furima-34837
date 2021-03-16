class Item < ApplicationRecord



  #アクティブハッシュの際に必要になる記述 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address1
  belongs_to :status
  belongs_to :fee
  belongs_to :day
  belongs_to :category
  #アクティブハッシュの際に必要になる記述 



  has_one_attached :image 

  with_options presence: true do
  validates :image
  validates :item
  validates :explanation
  validates :category_id , numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :fee_id, numericality: { other_than: 1 } 
  validates :address1_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  end


  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
 

  has_one    :purchase
  belongs_to :user
end
