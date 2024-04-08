class CreateJoinTableUserRoles < ActiveRecord::Migration[7.0]
  create_join_table :users, :roles, table_name: :user_roles do |t|
    t.index :user_id
    t.index :role_id
  end
end
