class UpdateKeyQuestions < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :tests, on_delete: :cascade
  end
end
