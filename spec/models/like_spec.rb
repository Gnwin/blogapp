require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'George', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', text: 'sweet text!')

  subject { Like.new(user:, post:) }

  before { subject.save }
end
