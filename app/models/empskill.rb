class Empskill < ApplicationRecord
	belongs_to :employee
  	belongs_to :skill
  	has_one :linkedin_oauth_setting
end
