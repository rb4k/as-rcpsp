class CreateProcedureUsers < ActiveRecord::Migration
  def change
    create_table :procedure_users do |t|
      t.integer :procedure_id
      t.integer :user_id

      t.timestamps
    end
  end
end
