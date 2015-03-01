class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :kapabe
      t.integer :prot
      t.integer :project_id

      t.timestamps
    end
  end
end
