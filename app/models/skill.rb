class Skill < ApplicationRecord
	validates :name, presence: true
	has_one :linkedin_oauth_setting
	has_many :empskill
	has_many :employee, :through => :empskill
end
