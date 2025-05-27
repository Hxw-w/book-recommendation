class CreateReadingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_records do |t|
      t.integer :user_id
      t.references :book, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
