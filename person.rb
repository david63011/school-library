require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end

person1 = Person.new(25, name: 'jex', parent_permission: false)
puts person1.name
puts person1.age
puts person1.id
puts person1.can_use_services?
