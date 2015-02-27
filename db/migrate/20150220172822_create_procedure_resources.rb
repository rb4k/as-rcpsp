class CreateProcedureResources < ActiveRecord::Migration
  def change
    create_table :procedure_resources do |t|
      t.integer :procedure_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
