class BooksController < ApplicationController
  def index
    @genre = params[:genre]
    @sort = params[:sort]
    
    @books = Book.includes(:author, :reading_records)
    @books = @books.where(genre: @genre) if @genre.present?
    @books = @books.sort_by(&:average_rating).reverse if @sort == "rating"
  end
end

