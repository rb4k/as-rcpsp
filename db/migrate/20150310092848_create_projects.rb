class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :path
      t.date :deadline
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :zw
      t.integer :totalc
      t.integer :extrac

      t.timestamps
    end
  end
end
