class Post < ApplicationRecord
  extend Enumerize

  has_many :post_tags
  has_many :tags, through: :post_tags

  belongs_to :administrator, foreign_key: :author_id

  enumerize :status, in: {
    published: 0,
    not_published: 1
  }, scope: true

  enumerize :allow_comment, in: {
    allow: true,
    disallow: false
  }, scope: true

  enumerize :linkage_twitter, in: {
    linkage: true,
    not_linkage: false
  }, scope: true

  validates :title, presence: true, length: { maximum: 255 }

  scope :published, -> { order(published_at: :desc).where('published_at <= ?', Time.now).with_status(:published) }
end
