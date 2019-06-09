class CreateTaxRates < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_rates do |t|
      t.string :rate_code
      t.integer :priority
      t.references :tax_class, foreign_key: true

      t.timestamps
    end
  end
end
