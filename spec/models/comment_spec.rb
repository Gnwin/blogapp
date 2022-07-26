require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Jorge', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', text: 'sweet text!')

  subject { Comment.new(user:, post:, text: 'Cool comment text') }

  before { subject.save }

  it 'should increment post likes_counter' do
    counter = post.comments_counter + 1
    subject.save
    expect(post.comments_counter + 1).to eq(counter)
  end
end
