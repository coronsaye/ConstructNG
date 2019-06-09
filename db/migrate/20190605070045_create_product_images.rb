class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.references :product, foreign_key: true
      t.string :image_base64
      t.string :image_url
      t.string :html_content
      t.string :sort_order

      t.timestamps
    end
  end
end
