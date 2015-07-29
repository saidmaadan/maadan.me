class Comment < ActiveRecord::Base

	belongs_to :project
	validates :name, presence: true
	validates :email, presence: true,
                  format: /\A\S+@\S+\z/
	validates :remark, length: { minimum: 4 }

	def gravatar_id
	    Digest::MD5::hexdigest(email.downcase)
	end
end
