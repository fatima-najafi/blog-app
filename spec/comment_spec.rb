require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:second_user) { User.create(name: 'Agneta', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from India.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }

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

end