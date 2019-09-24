class AddUserIdToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :users_id, :integer
  end
end
