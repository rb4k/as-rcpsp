class Resource < ActiveRecord::Base
  attr_accessible :created_at, :name, :ocr, :cost, :oce

  has_many :procedure_resources, :dependent => :destroy
  has_many :procedures, through: :procedure_resources
  has_many :users, :dependent => :destroy

  validates :ocr, :numericality => {:only_integer => true}
  validates :cost, :numericality => {:only_integer => true}

end
