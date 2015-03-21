class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :prot
      t.integer :fa, :default => 0
      t.integer :sa, :default => 0
      t.integer :fe, :default => 0
      t.integer :se, :default => 0
      t.integer :optp, :default => 0

      t.timestamps
    end
  end
end
