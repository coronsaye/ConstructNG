class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :short_decription
      t.string :long_description
      t.decimal :price
      t.references :manufacturer, foreign_key: true
      t.references :tax_class, foreign_key: true

      t.timestamps
    end
  end
end
