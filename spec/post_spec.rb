require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:second_user) { User.create(name: 'Agneta', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from India.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }

  # Title validation unit test:.......................

  it 'is valid with a title' do
    expect(subject).to be_valid
  end

  it 'is invalid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with a title of maximum length (250 characters)' do
    title = 'A' * 250
    subject.title = title
    expect(subject).to be_valid
  end

  it 'is invalid with a title longer than 250 characters' do
    title = 'A' * 251
    subject.title = title
    expect(subject).not_to be_valid
  end

  # comments_counter unit test.....................

  it 'updates comments_counter when a comment is added' do
    initial_comments_counter = 0
    expect(subject.comments_counter).to eq(initial_comments_counter)
    subject.save
    subject.comments.create(post: first_post, author: second_user, text: 'Hi Tom!')
    expect(subject.reload.comments_counter).to eq(initial_comments_counter + 1)
  end

  it 'should raise an error if comments_counter is negative' do
    subject.comments_counter = -1
    expect(subject).not_to be_valid
  end

  it 'should be valid when comments_counter is zero' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'should be valid when comments_counter is positive' do
    subject.comments_counter = 5
    expect(subject).to be_valid
  end

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

  # test recent_comment
  it 'should have a recent_comments method' do
    expect(first_post).to respond_to(:recent_comments)
  end
end
