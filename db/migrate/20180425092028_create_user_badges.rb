class CreateUserBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_badges do |t|
      t.references :user, foreign_key: true, index: true
      t.references :badge, foreign_key: true, index: true

      t.timestamps
    end
  end
end
