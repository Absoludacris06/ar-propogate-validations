class Event < ActiveRecord::Base
	validates :date, presence: true
	validate :date_cannot_be_in_the_past
	validates :title, presence: true, uniqueness: true
	validates :organizer_name, presence: true
	validates :organizer_email, format: { with: /^\S+@\S+\.\S+$/, message: "is invalid" }

	def date_cannot_be_in_the_past
		if date.nil? || date < Date.today
			errors.add(:date, "cannot be in the past")
		end
	end
end
