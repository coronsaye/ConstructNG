class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :individual, foreign_key: true
      t.string :name
      t.string :customer_code
      t.string :class
      t.decimal :wallet_bal

      t.timestamps
    end
  end
end
