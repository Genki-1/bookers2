class AddBookIdToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :book_id, :integer
  end
end
