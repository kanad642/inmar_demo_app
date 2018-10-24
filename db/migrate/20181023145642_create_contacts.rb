class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :status,   null: false, default: true
      t.string :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
