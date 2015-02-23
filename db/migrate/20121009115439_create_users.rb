class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :capacity

      t.integer :ocr

      t.timestamps
    end
  end
end
