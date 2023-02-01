require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom 

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
  
  def classroom = (classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

student1 = Student.new(25, name: 'Petesz', parent_permission: false, classroom: 'Math')
puts student1.name
puts student1.age
puts student1.can_use_services?
puts student1.play_hooky
puts student1.classroom
