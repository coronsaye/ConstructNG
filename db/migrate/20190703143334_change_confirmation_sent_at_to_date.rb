class ChangeConfirmationSentAtToDate < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :confirmation_sent_at
    add_column :users, :confirmation_sent_at, :datetime
  end

  def down
    remove_column :users, :confirmation_sent_at
    add_column :users, :confirmation_sent_at, :string
  end
end
