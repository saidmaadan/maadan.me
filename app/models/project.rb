class Project < ActiveRecord::Base
	mount_uploader :screenshot, ScreenshotUploader

	extend FriendlyId
  	friendly_id :name, use: :slugged

  	has_many :comments, dependent: :destroy

  	def recent_comments
    	comments.order('created_at desc')
  	end
end
