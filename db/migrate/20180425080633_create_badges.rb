class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :badge_image, null: false
      t.string :rule, null: false

      t.timestamps
    end
  end
end
