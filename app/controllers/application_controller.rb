class ApplicationController < ActionController::Base
	def index
		user = User.find(params[:userId])

		@appointments = []
		if( user.isCoach )
			@appointments = Appointment.where(coach: user)
		else
			@appointments = Appointment.where(client: user)
		end
	end
end
