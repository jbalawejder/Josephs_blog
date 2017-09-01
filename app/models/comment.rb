class Comment < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: 2 }

  has_many :votes, as: :voteable

  def vote_count
    votes.where(vote: true).count - votes.where(vote: false).count
  end

end
