class Procedure < ActiveRecord::Base
  attr_accessible :created_at, :kapabe, :name, :prot, :updated_at

  has_many :topologics, :dependent => :destroy

end
