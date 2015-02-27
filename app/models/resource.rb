class Resource < ActiveRecord::Base
  attr_accessible :created_at, :name, :totalcapa, :ocr, :cost

  has_many :procedure_resources, :dependent => :destroy
  has_many :users, :dependent => :destroy

end
