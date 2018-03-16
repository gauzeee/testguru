class RemoveIds < ActiveRecord::Migration[5.1]
  def up
    remove_column :answers, :question_id
    remove_column :questions, :test_id
    remove_column :tests, :category_id
  end
  def down
    add_column :answers, :question_id, :integer
    add_column :questions, :test_id, :integer
    add_column :tests, :category_id, :integer
  end
end
