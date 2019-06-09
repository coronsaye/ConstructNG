class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_type
      t.references :sector, foreign_key: true
      t.string :rc_no
      t.references :user, foreign_key: true
      t.string :office_email
      t.string :office_phone

      t.timestamps
    end
  end
end
