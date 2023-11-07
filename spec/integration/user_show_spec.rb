# require 'rails_helper'

# RSpec.describe 'Users', type: :feature do
#   describe 'User show page' do
#     before do
#       @user1 = User.create(name: 'Donia', photo: 'https://via.placeholder.com/150', bio: 'I love coding!')
#       @user1.save
#       @post1 = @user1.posts.create(title: 'Ruby', text: 'This is my second post.')
#       @post2 = @user1.posts.create(title: 'Java', text: 'ccc.')
#       # @post3 = @user1.posts.create(title: 'Third post', text: 'This is my third post.')
#     end

#     it "displays the user's profile picture" do
#       visit user_path(@user1)
#       expect(page).to have_css("img[src='#{@user1.photo}']")
#     end

#     it "displays the user's username" do
#       visit user_path(@user1)
#       expect(page).to have_content(@user1.name)
#     end

#     it 'displays the number of posts the user has written' do
#       visit user_path(@user1)
#       expect(page).to have_content(@user1.posts_counter)
#     end

#     it "displays the user's bio" do
#       visit user_path(@user1)
#       expect(page).to have_content(@user1.bio)
#     end

#     it "displays the user's first 3 posts" do
#       visit user_path(@user1)
#       expect(page).to have_content(@post1.title)
#       expect(page).to have_content(@post2.title)
#       # expect(page).to have_content(@post3.title)
#     end

#     it 'should render the button that lets view all of a user\'s posts' do
#       visit user_path(@user1)
#       expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user1.id), class: 'all-post')
#     end

#     it "redirects to the post's show page , When I click a user's post" do
#       visit user_path(@user1)
#       click_link @post1.title
#       expect(current_path).to eq(user_post_path(@user1, @post1))
#     end

#     it "redirects to the user's posts index page when clicking on 'See all posts'" do
#       visit user_path(@user1)
#       click_link 'See all posts'
#       expect(current_path).to eq(user_posts_path(user_id: @user1.id))
#     end
#   end
# end
