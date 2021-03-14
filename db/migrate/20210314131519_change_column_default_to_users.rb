class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :biography, from: nil, to: "自己紹介を追加しましょう"
  end
end
