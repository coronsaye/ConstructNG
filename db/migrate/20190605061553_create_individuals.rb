class CreateIndividuals < ActiveRecord::Migration[5.2]
  def change
    create_table :individuals do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :title
      t.string :gender
      t.date :birth_date
      t.string :about
      t.string :picture
      t.references :occupation, foreign_key: true
      t.references :user, foreign_key: true
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.string :tagline

      t.timestamps
    end
  end
end
