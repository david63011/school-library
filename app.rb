require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  attr_accessor :books, :people

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
  
  def list_people_rentals
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(age, name: 'Unknown')
    person = Person.new(age, name: name)
    @people.push(person)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(date, personid, bookid)
    puts
    rental = Rental.new(date, @people[personid], @books[bookid])
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts
  end

  def list_rentals_by_person_id(person_id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
  
  def list_rentals(id)
    puts
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    puts
  end

  def create_student(classroom, age, name, parent_permission)
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    puts
    @people.push(student)
    puts 'Person created successfully'
    puts
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name: name)
    @people.push(teacher)
    puts
    puts 'Person created successfully'
    puts
  end
end
