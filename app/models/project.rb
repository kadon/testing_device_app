class Project < ActiveRecord::Base
  attr_accessible :customer, :key, :name
  
  validates :name, presence: true
  validates :customer, presence: true 
end
