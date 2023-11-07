require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before do
    @user1 = User.create(name: 'Tom', photo: 'https://via.placeholder.com/150', bio: 'I love coding!',
                         posts_counter: 2)
    @user2 = User.create(name: 'Sana', photo: 'https://via.placeholder.com/150', bio: 'I love reading!',
                         posts_counter: 0)
  end

  describe 'User index page' do
    it 'displays the username of all other users' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'displays the profile picture for each user' do
      visit users_path
      expect(page).to have_css("img[src='#{@user1.photo}']")
      expect(page).to have_css("img[src='#{@user2.photo}']")
    end

    it 'displays the number of posts each user has written' do
      visit users_path
      expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
      expect(page).to have_content("Number of posts: #{@user2.posts_counter}")
    end

    it "redirects to user's show page when clicking on a user" do
      visit users_path
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
