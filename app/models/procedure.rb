class Procedure < ActiveRecord::Base
  attr_accessible :created_at, :kapabe, :name, :prot, :updated_at

  has_many :topologics_to,
           :foreign_key => 'prepro_id', :class_name => 'Topologic'

  has_many :topologics_from,
           :foreign_key => 'sucpro_id', :class_name => 'Topologic'

end
