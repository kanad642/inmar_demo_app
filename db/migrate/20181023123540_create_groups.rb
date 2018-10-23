class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :status,   null: false, default: true
      t.integer :user_id
      t.text :group_desp

      t.timestamps
    end
  end
end
