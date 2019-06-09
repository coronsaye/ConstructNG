class CreateTaxClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_classes do |t|
      t.string :title
      t.string :decription

      t.timestamps
    end
  end
end
