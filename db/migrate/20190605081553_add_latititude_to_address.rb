class AddLatititudeToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lattitude, :decimal
  end
end
