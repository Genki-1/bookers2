class Search < ApplicationRecord

	def self.user_search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      User.where(['name LIKE ?', "%#{search}%"])
	    else
	      User.all #全て表示。
	    end
	end

	def self.book_search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      Book.where(['title LIKE ?', "%#{search}%"])
	    else
	      Book.all #全て表示。
	    end
	end

end
