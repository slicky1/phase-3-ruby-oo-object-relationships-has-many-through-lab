
class Doctor

    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
    
    def new_appointment(date, patient)
      appointment = Appointment.new(date, patient, self)
      Appointment.all << appointment
      appointment
    end
  
    def appointments
      Appointment.all.select{|et| et.doctor == self}
    end
  
    # original method worked:
    def patients_0
      appointments.map{|et| et.patient}.uniq
    end
  
    # shortcut notation from the official solution
    # also works:
    def patients
      appointments.map(&:patient).uniq
    end
  end