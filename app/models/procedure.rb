class Procedure < ActiveRecord::Base
  attr_accessible :created_at, :fa, :fe, :name, :prot, :sa, :se, :updated_at, :optp

  has_many :procedure_resources, :dependent => :destroy
  has_many :resources, through: :procedure_resources
  has_many :procedure_procedures, foreign_key: "prepro_id", :dependent => :destroy
  has_many :reverse_procedure_procedures, foreign_key: "sucpro_id", class_name: "ProcedureProcedure", :dependent => :destroy

  validates :prot, :numericality => {:only_integer => true}
  validates :name, length: { minimum: 12}

end
