class Employeeskill < ApplicationRecord

	# validates :name, presence: true

	belongs_to :employee
	belongs_to :skill
end
