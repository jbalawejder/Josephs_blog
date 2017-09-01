class Article < ActiveRecord::Base
  has_many :comments
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :body, presence: true

  def vote_count
    votes.where(vote: true).count - votes.where(vote: false).count
  end

end
