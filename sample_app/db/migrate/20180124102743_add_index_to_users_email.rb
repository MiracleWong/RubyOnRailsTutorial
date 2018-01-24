class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # 增加索引，并设置唯一性约束
    add_index :users, :email, unique: true
  end
end
