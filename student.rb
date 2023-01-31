require_relative 'person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student1 = Student.new(13, name: 'Petesz', parent_permission: false, classroom: 'Math')
puts student1.name
puts student1.age
puts student1.can_use_services?
puts student1.play_hooky
puts student1.classroom
