class CreateCakesGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :cakes_groups do |t|
      t.belongs_to :cake, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
