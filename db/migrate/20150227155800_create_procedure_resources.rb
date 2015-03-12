class CreateProcedureResources < ActiveRecord::Migration
  def change
    create_table :procedure_resources do |t|
      t.integer :resource_id
      t.integer :procedure_id
      t.integer :capa_demand

      t.timestamps
    end
  end
end
