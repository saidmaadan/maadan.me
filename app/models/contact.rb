class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true,
                  format: /\A\S+@\S+\z/
    validates :comments, length: { minimum: 20 }
end
