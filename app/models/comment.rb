class Comment < ActiveRecord::Base

	belongs_to :project
	validates :name, presence: true
	validates :email, presence: true,
                  format: /\A\S+@\S+\z/
	validates :remark, length: { minimum: 4 }


end
