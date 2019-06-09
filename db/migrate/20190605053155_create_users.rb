class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_no
      t.string :username
      t.boolean :status
      t.string :password
      t.string :default_password
      t.boolean :email_confirmed
      t.boolean :phoneno_confirmed
      t.integer :parent

      t.timestamps
    end
    add_index :users, :email
  end
end
