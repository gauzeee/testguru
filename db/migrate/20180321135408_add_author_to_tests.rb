class AddAuthorToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :author, references: :users
  end
end
