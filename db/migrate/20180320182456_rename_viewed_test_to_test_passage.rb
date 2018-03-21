class RenameViewedTestToTestPassage < ActiveRecord::Migration[5.1]
  def change
    rename_table :viewed_tests, :test_passages
  end
end
