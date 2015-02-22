class ProcedureProcedure < ActiveRecord::Base
  attr_accessible :prepro_id, :sucpro_id

  belongs_to :prepro, class_name: "Procedure"
  belongs_to :sucpro, class_name: "Procedure"

  end
