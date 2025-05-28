# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#
class Book < ApplicationRecord
  belongs_to :author
  has_many :reading_records
  has_many :users, through: :reading_records

  def average_rating
    reading_records.average(:rating)&.round(2) || 0
  end

end
