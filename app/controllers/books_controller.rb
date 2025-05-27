class BooksController < ApplicationController
  def index
    @books = Book.all
    @recent_readings = ReadingRecord.includes(:book, :user).order(created_at: :desc).limit(10)
  end

  def show
  end
end
