class Procedure < ActiveRecord::Base
  attr_accessible :created_at, :kapabe, :name, :prot, :updated_at

  has_many :topologics, foreign_key: "prepro_id", :dependent => destroy
  has_many :reverse_topologics, foreign_key: "sucpro_id", class_name: "Topologic", :dependent => :destroy
  has_many :procedure_users, :dependent => :destroy

end
