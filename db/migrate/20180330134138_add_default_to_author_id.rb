class AddDefaultToAuthorId < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tests, :author_id, 1
  end
end
