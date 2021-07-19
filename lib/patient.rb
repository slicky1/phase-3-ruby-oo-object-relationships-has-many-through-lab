
class Patient

    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
    
    def new_appointment(date, doctor)
      appointment = Appointment.new(date, self, doctor)
      Appointment.all << appointment
      appointment
    end
  
    def appointments
      Appointment.all.select{|et| et.patient == self}
    end
  
    # original method worked:
    def doctors_0
      appointments.map{|et| et.doctor}.uniq
    end
  
    # shortcut notation from the official solution
    # also works:
    def doctors
      appointments.map(&:doctor).uniq
    end
  end