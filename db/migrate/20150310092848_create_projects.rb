class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :gvp
      t.string :path
      t.date :startdate
      t.date :deadline
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :zwt
      t.integer :zwc
      t.integer :totalc
      t.integer :extrac

      t.timestamps
    end
  end
end
