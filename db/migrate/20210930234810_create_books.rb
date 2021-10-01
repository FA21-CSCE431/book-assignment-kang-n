class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :published_date
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
