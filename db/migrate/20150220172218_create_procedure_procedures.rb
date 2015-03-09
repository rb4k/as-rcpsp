class CreateProcedureProcedures < ActiveRecord::Migration
  def change
    create_table :procedure_procedures do |t|
      t.integer :prepro_id
      t.integer :sucpro_id

      t.timestamps
    end
  end
end
