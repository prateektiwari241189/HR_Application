class Skillquality < ApplicationRecord

	attr_accessible :name

	validates :name, :presence => true
	has_many :empskillqualities
	has_many :emps, :through => :empskillqualities
end
