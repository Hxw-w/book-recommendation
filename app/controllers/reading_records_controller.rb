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
end

