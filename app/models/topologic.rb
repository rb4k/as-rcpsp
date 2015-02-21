class Topologic < ActiveRecord::Base
  attr_accessible :prepro_id, :sucpro_id

  belongs_to :procedure,
             :class_name => 'Procedure', :foreign_key => 'prepro_id'

  belongs_to :procedure,
             :class_name => 'Procedure', :foreign_key => 'sucpro_id'

end
