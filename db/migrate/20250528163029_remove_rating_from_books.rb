class RemoveRatingFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :rating, :integer
  end
end
