class ChangeConfirmationSentTodate < ActiveRecord::Migration[5.2]


  def up
    remove_column :users, :confirmed_at
    add_column :users, :confirmed_at, :datetime
  end

  def down
    remove_column :users, :confirmed_at
    add_column :users, :confirmed_at, :string
  end
end
