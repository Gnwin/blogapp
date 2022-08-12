# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email:
  'nwgwin@gmail.com', password: 'godwin', password_confirmation: 'godwin')

second_user = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Portugal.', email:
  'chioma@gmail.com', password: 'chioma', password_confirmation: 'chioma')

first_post = Post.create(user_id: first_user.id, title: 'Hello', text: 'This is my first post')
