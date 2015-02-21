class Topologic < ActiveRecord::Base
  attr_accessible :prepro_id, :sucpro_id

  belongs_to :procedure
  belongs_to :procedure

end
