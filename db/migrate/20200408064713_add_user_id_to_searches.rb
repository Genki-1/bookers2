class AddUserIdToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :user_id, :integer
  end
end
