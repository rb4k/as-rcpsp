class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.string :kapabe
      t.string :prot

      t.timestamps
    end
  end
end
