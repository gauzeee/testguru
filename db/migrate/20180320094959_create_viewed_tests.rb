class CreateViewedTests < ActiveRecord::Migration[5.1]
  def change
    create_table :viewed_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
