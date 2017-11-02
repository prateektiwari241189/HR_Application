class Emp < ApplicationRecord
	attr_accessible :name

	validates :name, :presence => true
	has_many :empskillqualities
	has_many :skillqualities, :through => :empskillqualities
end
