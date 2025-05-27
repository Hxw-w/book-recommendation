class ReadingRecordsController < ApplicationController
  def new
    @books = Book.all
  end

  def create
    record = ReadingRecord.new
    record.user_id = params[:user_id] || 1  # temp placeholder
    record.book_id = params[:book_id]
    record.rating = params[:rating]
    record.comment = params[:comment]

    if record.save
      redirect_to books_path, notice: "Your rating was saved!"
    else
      redirect_to new_reading_record_path, alert: "Something went wrong."
    end
  end

  def index
    @genres = Book.distinct.pluck(:genre).compact.sort

    @selected_genre = params[:genre]
    @sort_order = params[:sort] == "rating" ? "DESC" : "created_at DESC"

    @reading_records = ReadingRecord.includes(:user, :book)

    if @selected_genre.present?
      @reading_records = @reading_records.joins(:book).where(books: { genre: @selected_genre })
    end

    @reading_records = @reading_records.order("rating #{@sort_order}")
  end

end
