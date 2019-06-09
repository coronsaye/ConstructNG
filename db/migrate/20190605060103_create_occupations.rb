class CreateOccupations < ActiveRecord::Migration[5.2]
  def change
    create_table :occupations do |t|
      t.string :name
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
