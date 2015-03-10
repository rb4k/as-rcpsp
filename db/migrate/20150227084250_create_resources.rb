class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.datetime :created_at
      t.integer :oce, :default => 0
      t.integer :cost
      t.integer :ocr
      t.integer :ocd, :default => 0

      t.timestamps
    end
  end
end
