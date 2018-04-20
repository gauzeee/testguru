class UpdateKeyTestPassages < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :tests, on_delete: :cascade
  end
end
