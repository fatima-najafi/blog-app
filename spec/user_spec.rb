require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Fatima', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'I am a software engineer.', posts_counter: 0)
  end
  # Test most recent posts............

  it 'returns the most recent 3 posts' do
    subject.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
    recent_posts = subject.recent_posts
    expect(recent_posts.length).to eq(3)
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
end
