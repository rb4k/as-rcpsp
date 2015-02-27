class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.datetime :created_at
      t.integer :totalcapa
      t.integer :cost
      t.integer :ocr

      t.timestamps
    end
  end
end
