class Manager < ApplicationRecord

	validates :password, :presence =>true, :confirmation =>true
	validates_presence_of :email, :message => "can't be empty"
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
