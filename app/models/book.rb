class Book < ApplicationRecord

  belongs_to :user

  has_many :book_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

   def books
     return Book.find_by(user_id: self.id)
   end

   validates :title, presence: true

   validates :body, 
   presence: true, 
   length: { maximum: 199 }

end
