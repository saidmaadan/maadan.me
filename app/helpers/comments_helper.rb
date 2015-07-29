module CommentsHelper

	def profile_image_for(comment, options={})
	    size = options[:size] || 80
	    url = "https://secure.gravatar.com/avatar/#{comment.gravatar_id}?s=#{size}"
	    image_tag(url, alt: comment.name)
	  end
end
