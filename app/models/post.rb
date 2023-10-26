class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: {maximum: 250}
  # validates :comments_counter, numericality: {only_integer:true, greater_than_or_equal_to: 0}
  # validates :likes_counter, numericality :{only_integer:true, greater_than_or-equal_to: 0}

  after_save :update_user_posts_counter
  
  def recent_comments
    comments.order(created_at(Desc)).limit(5)
  end

  private

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end


end
