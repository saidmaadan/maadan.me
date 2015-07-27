class ContactMailer < ActionMailer::Base
	default to: 'said@maadan.me'

	def contact_email(name, email, website, body)
		@name = name
		@email = email
		@website = website
		@body = body

		mail(from: email, subject: 'Contact form Message')
	end

end