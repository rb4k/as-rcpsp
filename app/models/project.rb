class Project < ActiveRecord::Base
  attr_accessible :created_at, :startdate, :deadline, :name, :updated_at, :path, :zwt, :zwc, :totalc, :extrac
end
