class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.boolean :status,   null: false, default: true
      t.integer :group_id

      t.timestamps
    end
  end
end
