class ProcedureResource < ActiveRecord::Base
  attr_accessible :procedure_id, :resource_id

  belongs_to :procedure, class_name: "Procedure"
  belongs_to :resource, class_name: "Resource"

end
