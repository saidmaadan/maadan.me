class Project < ActiveRecord::Base
	mount_uploader :screenshot, ScreenshotUploader
end
