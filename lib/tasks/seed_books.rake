namespace :db do
  desc "Populate database with sample books and authors"
  task populate_books: :environment do
    10.times do
      author = Author.create!(name: Faker::Book.author, bio: Faker::Lorem.paragraph)
      5.times do
        Book.create!(
          title: Faker::Book.title,
          genre: Faker::Book.genre,
          rating: rand(1..5),
          author: author
        )
      end
    end

    puts "Created #{Author.count} authors and #{Book.count} books"
  end
end
