class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deadline
      t.boolean :closed

      t.timestamps
    end
  end
end
