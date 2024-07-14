emongg = User.new( name: "Emongg", phone: "(123)123-1234", isCoach: false )
flats = User.new( name: "Flat", phone: "(222)222-2222", isCoach: false )
karq = User.new( name: "KarQ", phone: "(333)333-3333", isCoach: true )
spilo = User.new( name: "Spilo", phone: "(444)444-4444", isCoach: true )

emongg.save!
flats.save!
karq.save!
spilo.save!

finished_appt = Appointment.new( start: DateTime.new(2024, 06, 14, 13, 0, 0), coach: spilo, client: emongg )
booked_appt = Appointment.new( start: DateTime.new(2024, 07, 20, 13, 0, 0), coach: karq, client: flats )
new_appt = Appointment.new( start: DateTime.new(2024, 07, 20, 13, 0, 0 ), coach: spilo)
finished_appt.save!
booked_appt.save!
new_appt.save!

finished_note = Note.new( note: "This guy is the goat", rating: 5, appointment: finished_appt)
finished_note.save!