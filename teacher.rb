require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization: 'Unknown', name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(87, name: 'Petesz', parent_permission: false, specialization: 'Math')
puts teacher1.name
puts teacher1.age
puts teacher1.can_use_services?
puts teacher1.specialization
