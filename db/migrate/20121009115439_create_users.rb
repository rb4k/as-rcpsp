class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :project_id
      t.integer :resource_id
      t.string :capacity

      t.timestamps
    end
  end
end
