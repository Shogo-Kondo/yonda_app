class AddIsbnCalligraphyToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :isbn_code, :string
    add_column :books, :calligraphy, :string
  end
end
