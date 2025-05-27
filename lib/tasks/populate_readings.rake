namespace :db do
  desc "Add random reading records for users"
  task populate_reading_records: :environment do
    users = User.all
    books = Book.all

    if users.empty? || books.empty?
      puts "❗ Add users and books first!"
      next
    end

    puts "Creating 50 reading records..."

    50.times do
      ReadingRecord.create!(
        user: users.sample,
        book: books.sample,
        rating: rand(1..5),
        comment: Faker::Quote.famous_last_words
      )
    end

    puts "✅ Done. Total Reading Records: #{ReadingRecord.count}"
  end
end
