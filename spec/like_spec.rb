require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:second_user) { User.create(name: 'Agneta', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from India.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }

 # likes_counter unit tests ...................

 it 'updates likes_counter when a like is added' do
    initial_likes_counter = 0
    expect(subject.likes_counter).to eq(initial_likes_counter)
    subject.save
    subject.likes.create(post: first_post, author: second_user)
    expect(subject.reload.likes_counter).to eq(initial_likes_counter + 1)
  end

  it 'should raise an error if likes_counter is negative' do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end

  it 'should be valid when likes_counter is zero' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'should be valid when likes_counter is positive' do
    subject.likes_counter = 5
    expect(subject).to be_valid
  end
end