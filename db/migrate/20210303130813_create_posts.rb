class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :evaluation
      t.text :content

      t.timestamps
    end
  end
end
