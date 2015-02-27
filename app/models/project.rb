class Project < ActiveRecord::Base
  attr_accessible :closed, :created_at, :deadline, :name, :updated_at

  has_many :procedures, :dependent => :destroy
end
