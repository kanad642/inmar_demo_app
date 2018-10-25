class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :status, default: "Active"
      t.integer :user_id
      t.text :group_desp
      t.timestamps
    end
  end
end
