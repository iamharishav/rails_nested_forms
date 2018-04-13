class Account < ApplicationRecord

	belongs_to :user
	validates :first_name, :last_name, :presence => true
	validates_uniqueness_of :user_id, :message => "User can only have one Profile"

	validates :user_id, presence: true, on: :update
	
end
