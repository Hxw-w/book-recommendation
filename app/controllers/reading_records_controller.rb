class ReadingRecordsController < ApplicationController
  def new
    @reading_record = ReadingRecord.new
    @books = Book.all
  end

  def create
    @reading_record = ReadingRecord.new(reading_record_params)
    @reading_record.user = current_user

    if @reading_record.save
      redirect_to profile_path, notice: "Rating submitted!"
    else
      @books = Book.all
      render :new
    end
  end

  private

  def reading_record_params
    params.require(:reading_record).permit(:book_id, :rating, :comment)
  end
end
