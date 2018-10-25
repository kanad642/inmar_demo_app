class CreateGroupContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :status, null: false, default: true
      t.integer :group_id, index: true
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
