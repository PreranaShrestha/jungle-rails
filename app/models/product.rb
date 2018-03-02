class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating
    if self.reviews.size > 0
        self.reviews.average(:rating)
    else
        'undefined'
    end
  end
end
