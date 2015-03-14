class ProcedureResource < ActiveRecord::Base
  attr_accessible :procedure_id, :resource_id, :capa_demand

  belongs_to :procedure, class_name: "Procedure"
  belongs_to :resource, class_name: "Resource"

  validates :capa_demand, :numericality => {:only_integer => true}

end
