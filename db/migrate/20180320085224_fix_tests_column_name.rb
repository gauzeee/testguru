class FixTestsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :tests, :categorie_id, :category_id
  end
end
