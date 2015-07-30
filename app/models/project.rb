class Project < ActiveRecord::Base
	mount_uploader :screenshot, ScreenshotUploader

	extend FriendlyId
  	friendly_id :name, use: :slugged

  	has_many :comments, dependent: :destroy

  	def recent_comments
    	comments.order('created_at desc')
  	end

  	def self.toShuffle
  	  projects = all.limit(3).shuffle
  	  projects.select do |p| p.name != p
  	  	projects
  	  end
  	end

end
