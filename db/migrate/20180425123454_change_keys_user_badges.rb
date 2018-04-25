class ChangeKeysUserBadges < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :user_badges, :users
    add_foreign_key :user_badges, :users, on_delete: :cascade
    remove_foreign_key :user_badges, :badges
    add_foreign_key :user_badges, :badges, on_delete: :cascade

  end
end
