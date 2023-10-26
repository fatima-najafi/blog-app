class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

 after_save :update_user_posts_counter

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end
  
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
