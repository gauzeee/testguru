class AddParameterToBadge < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :parameter, :string
  end
end
