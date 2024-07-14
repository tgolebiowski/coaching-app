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

		@new_appointment = Appointment.new(coach: @user)
	end

	def create
		appt_hash = params[:appointment]
		appointment_start = appt_hash[:start]
		coach_id = appt_hash[:coach_id]

		#TODO: validation
		#check that user is coach
		#check that user does not have a conflicting appointment (as coach or client)
		# other sanity checks on dates, should be date in the future, etc.

		# TODO: security, you shouldn't be able to make appointments for coaches if you're not logged in as that coach

		coach = User.find(coach_id)
		appointment = Appointment.new(coach: coach, start: appointment_start)
		appointment.save!

		redirect_to "/view/#{coach_id}"
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
