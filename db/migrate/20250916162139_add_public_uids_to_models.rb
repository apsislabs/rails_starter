class AddPublicUidsToModels < ActiveRecord::Migration[8.0]
  def change
    safety_assured do
      add_column :users, :public_uid, :string
      add_index :users, :public_uid, unique: true
    end
  end
end
