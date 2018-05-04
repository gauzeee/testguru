class AddRuleToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule, :string, null: false
  end
end
