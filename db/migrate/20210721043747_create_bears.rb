class CreateBears < ActiveRecord::Migration[6.1]
  def change
    create_table :bears do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
