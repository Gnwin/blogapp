require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Jorge', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', text: 'sweet text!')

  subject { Comment.new(user:, post:, text: 'Cool comment text') }

  before { subject.save }
end
