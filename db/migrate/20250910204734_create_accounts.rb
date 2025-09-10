class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :public_uid, index: { unique: true }
      t.timestamps
    end
  end
end
