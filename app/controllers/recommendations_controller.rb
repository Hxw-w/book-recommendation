class RecommendationsController < ApplicationController
  def index
    @genres = Book.distinct.pluck(:genre)
    @books = []

    if params[:genre].present?
      rated_book_ids = ReadingRecord.where(user_id: 1).pluck(:book_id)
      @books = Book.where(genre: params[:genre]).where.not(id: rated_book_ids).order(rating: :desc).limit(10)
    end
  end
end

