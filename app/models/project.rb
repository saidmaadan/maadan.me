class Project < ActiveRecord::Base
	mount_uploader :screenshot, ScreenshotUploader

	extend FriendlyId
  friendly_id :name, use: :slugged
end
