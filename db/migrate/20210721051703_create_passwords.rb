class CreatePasswords < ActiveRecord::Migration[6.1]
  def change
    create_table :passwords do |t|
      t.string :secret, null: false
      t.timestamps
    end
  end
end
