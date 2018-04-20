class UpdateKeyTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :test_passages, :tests, on_delete: :cascade
  end
end
