class Employee < ApplicationRecord
	belongs_to :department
	has_many :empskill
	has_many :skill, :through => :empskill
	has_one :basic_profile
	has_one :full_profile
	has_one :linkedin_oauth_setting
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    mount_uploader :image, ImageUploader
    self.per_page = 10

end
