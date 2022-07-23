class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def increment_user_posts_count
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
