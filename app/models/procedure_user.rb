class ProcedureUser < ActiveRecord::Base
  attr_accessible :procedure_id, :user_id

  belongs_to :procedure
  belongs_to :user
end
