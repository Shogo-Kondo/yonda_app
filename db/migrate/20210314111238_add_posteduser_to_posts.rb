class AddPosteduserToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :posted_user, :string
  end
end
