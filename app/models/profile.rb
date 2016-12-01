class Profile < ActiveRecord::Base
	belongs_to :user
	validate :name_not_null
	validate :gender_validator
	validate :not_a_silly_name
	validates :gender, presence: true

	def name_not_null
		if first_name == nil && last_name == nil
			errors.add(:first_name,"both can't be empty")
		end
	end

	def gender_validator
		if gender != "male" && gender != "female"
			errors.add(:gender,"must be male or female")
		end
	end

	def not_a_silly_name
		if gender == "male" && first_name == "Sue"
			errors.add(:gender,"that's a dumb name")
		end
	end

	def self.get_all_profiles(min,max)
		Profile.where("birth_year BETWEEN ? and ?",min, max).order(:birth_year)
	end

end

