class RecommendationsController < ApplicationController
  def index
    @genre = params[:genre]
    @recommended_books = Book
      .includes(:reading_records, :author)
      .where(genre: @genre)
      .select { |book| book.average_rating.present? }
      .sort_by(&:average_rating)
      .reverse
  end
end

