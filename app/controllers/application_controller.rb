class ApplicationController < ActionController::Base
	def index
		@user = User.find(params[:userId])

		@appointments = []
		if( @user.isCoach )
			@appointments = Appointment.where(coach: @user)
		else
			@appointments = Appointment.where(client: @user)
		end

		@available_sessions = Appointment.where(client: nil)
	end

	def book
		appointment_id = params[:appt_id]
		user_booking_id = params[:user_id]

		appointment = Appointment.find(appointment_id)
		client = User.find(user_booking_id)

		# TODO: validations
		# check that appointment doesn't already have client
		# check that appointment hasn't passed

		appointment.client = client
		appointment.save!

		redirect_to "/view/#{user_booking_id}"
	end
end
