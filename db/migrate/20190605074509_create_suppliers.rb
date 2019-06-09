class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :supplier_code
      t.string :supplier_type
      t.text :about

      t.timestamps
    end
  end
end
