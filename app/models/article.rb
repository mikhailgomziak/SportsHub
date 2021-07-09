class Article < ApplicationRecord
  include Commentable

  has_one_attached :photo
  has_many :comments, inverse_of: :article, dependent: :destroy

  belongs_to :location
  belongs_to :category, inverse_of: :articles

  validates :headline, presence: true, length: { maximum: 100 }
  validates :alt_text, length: { maximum: 100 }
  validates :caption, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :location_id, presence: true
  validates :category_id, presence: true
end