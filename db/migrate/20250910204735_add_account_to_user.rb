class AddAccountToUser < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    add_reference :users, :account, type: :uuid, index: {algorithm: :concurrently}
  end
end
