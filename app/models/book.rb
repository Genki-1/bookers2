class Book < ApplicationRecord

	belongs_to :user

	def books
	  return Book.find_by(user_id: self.id)
	end
end
