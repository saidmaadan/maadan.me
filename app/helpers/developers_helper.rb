module DevelopersHelper

	def profile_image_for(developer, options={})
    size = options[:size] || 80
    url = "https://secure.gravatar.com/avatar/#{developer.gravatar_id}?s=#{size}"
    image_tag(url, alt: developer.name)
  end
end
