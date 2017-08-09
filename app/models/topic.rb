class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :posts

  def self.with_posts
    includes(:posts).where.not(posts: {id: nil})
  end
end
