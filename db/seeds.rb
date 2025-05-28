# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Clear old data
ReadingRecord.destroy_all
User.destroy_all
Book.destroy_all
Author.destroy_all

# Create Authors and Books
100.times do
  author = Author.create!(
    name: Faker::Book.author,
    bio: Faker::Lorem.paragraph
  )

  5.times do
    Book.create!(
      title: Faker::Book.title,
      genre: Faker::Book.genre,
      rating: rand(1..5),
      author: author
    )
  end
end

# Create Users
# Create Users
100.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password123",        # Add a default password
    password_confirmation: "password123"
  )
end

# Create Reading Records
50.times do
ReadingRecord.create!(
  user_id: User.all.sample.id,
  book_id: Book.all.sample.id,
  rating: rand(1..5),
  comment: Faker::Quote.famous_last_words
)
end

puts "Seeded #{Author.count} authors, #{Book.count} books, #{User.count} users, and #{ReadingRecord.count} reading records."
