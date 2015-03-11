class Project < ActiveRecord::Base
  attr_accessible :created_at, :deadline, :name, :updated_at, :path, :zw, :totalc, :extrac
end
