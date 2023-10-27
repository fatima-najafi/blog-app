require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Fatima', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'I am a software engineer.', posts_counter: 0)
  end
  # Name must not be blank.
  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  # PostsCounter must be an integer greater than or equal to zero.
  it 'is invalid if posts_counter is not an integer' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end
  it 'is invalid if posts_counter is less than zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  # Photo must not be blank.
  it 'is invalid without a photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end
  # Bio must not be blank.
  it 'is invalid without a bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  # Test most recent posts............
  it 'returns the 3 most recent posts' do
    create_posts(subject, 5) # Helper method to create 5 posts for the subject
    recent_posts = subject.recent_posts
    expect(recent_posts.length).to eq(3)
    expect(recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end
end

def create_posts(subject, count)
  count.times do |i|
    subject.posts.create(title: "Post #{i + 1}", text: "This is the #{i + 1} post.", comments_counter: 0,
                         likes_counter: 0)
  end
end
