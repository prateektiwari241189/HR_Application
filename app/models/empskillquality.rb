class Empskillquality < ApplicationRecord

	attr_accessible :name

	belongs_to :emp
	belongs_to :skillquality
end
