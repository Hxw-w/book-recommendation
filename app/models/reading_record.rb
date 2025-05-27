# == Schema Information
#
# Table name: reading_records
#
#  id         :bigint           not null, primary key
#  comment    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :integer
#
# Indexes
#
#  index_reading_records_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class ReadingRecord < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
