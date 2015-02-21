class Topologic < ActiveRecord::Base
  attr_accessible :prepro_id, :sucpro_id
  validates :numericality => {greater_than => 0}, :presence => true

  belongs_to :prepro, class_name: "Procedure"
  belongs_to :sucpro, class_name: "Procedure"

  end
