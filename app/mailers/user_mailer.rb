class UserMailer < ApplicationMailer
	default from: "kelvinpankow@yahoo.com"

		def contact_form(email, name, message)
			@message = message
				mail(from: email,
        			to: 'kelvinpankow@yahoo.com',
        			subject: "A new contact form message from #{name}")
  		end

  		def welcome(user)
  			@user = user
  			@appname = "Berlin Bikes"
  			mail(to: user.email,
       			subject: "Welcome to #{@appname}!")
		end
end
