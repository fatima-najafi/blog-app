require 'rails_helper'
RSpec.describe 'Posts', type: :feature do
  describe 'Post index page' do
    before :each do
      @user = User.create(name: 'Bunny', photo: 'https://somewhere.com/an_ordinary_photo.jpg',
                          bio: 'Anyone in this world', posts_counter: 0)
      @user.save
      @post = Post.create(author: @user, title: 'Nonsense', text: 'This guy should stop spitting bullshit')
      @post.save
    end
    it 'should render the profile picture of the user' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'should render the username' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@user.name)
    end
    it 'should render the number of posts written by the user' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@user.posts_counter)
    end
    it 'should render the title of the post' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.title)
    end
    it 'should render the trimmed text of the post' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.text.truncate(40))
    end
    it 'should render the first comment of a post' do
      comment = Comment.create(author: @user, post: @post, text: 'This is a comment')
      comment.save
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(comment.text)
    end
    it 'should render the number of comments of a post' do
      comment = Comment.create(author: @user, post: @post, text: 'This is a comment')
      comment.save
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.comments_counter)
    end
    it 'should render the number of likes of a post' do
      like = Like.create(author: @user, post: @post)
      like.save
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.likes_counter)
    end
    it 'should render a button pagination' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_css('.pagination-btn')
    end
    it 'should redirect to the post show page' do
      visit user_posts_path(user_id: @user.id)
      click_link @post.title
      expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @post.id))
    end
  end
end
