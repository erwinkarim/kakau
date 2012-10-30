class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :kind
      t.references :user
      t.integer :parent
      t.string :avatar

      t.timestamps
    end
    add_index :boxes, :user_id
  end
end
