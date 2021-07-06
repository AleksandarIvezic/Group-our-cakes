class CreateCakes < ActiveRecord::Migration[6.1]
  def change
    create_table :cakes do |t|
      t.integer :author_id
      t.integer :group_id
      t.string :name
      t.integer :amount
      

      t.timestamps
    end
  end
end
