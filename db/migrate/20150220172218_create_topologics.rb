class CreateTopologics < ActiveRecord::Migration
  def change
    create_table :topologics do |t|
      t.integer :prepro_id
      t.integer :sucpro_id

      t.timestamps
    end
  end
end
