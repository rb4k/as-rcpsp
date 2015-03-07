class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :kapabe
      t.integer :prot
      t.integer :fa
      t.integer :sa
      t.integer :fe
      t.integer :se

      t.timestamps
    end
  end
end
