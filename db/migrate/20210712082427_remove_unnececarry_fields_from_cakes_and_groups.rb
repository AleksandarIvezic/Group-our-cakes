class RemoveUnnececarryFieldsFromCakesAndGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :cakes, :group_id, :integer
    remove_column :groups, :cake_id, :integer
  end
end
