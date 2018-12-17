class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
