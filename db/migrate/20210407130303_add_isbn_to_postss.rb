class AddIsbnToPostss < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :isbn_code, :string
  end
end
