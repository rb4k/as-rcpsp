class ProcedureResource < ActiveRecord::Base
  attr_accessible :procedure_id, :resource_id

  belongs_to :procedure
  belongs_to :resource

end
