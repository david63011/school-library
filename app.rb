require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'classroom'
require_relative 'handler'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  include Handler
  # read rentals
  def read_rentals
    @rentals = []
    array = read_json(RENTAL_FILE)
    array.each do |rental|
      @rentals.push(rental)
    end
  end

  def list_books
    puts
    if @books.empty?
      puts 'No books added yet'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
    puts
  end
  
  def list_books_rent
    puts
    if @books.empty?
      puts 'No books added yet'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_people
    puts
    if @people.empty?
      puts 'No people added yet'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def list_people_rentals
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(id, age, name: 'Unknown')
    person = Person.new(id, age, name: name)
    @people.push(person)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(date, personid, bookid)
    puts
    str1 = {"date": date, "person": {"name": @people[personid].name, "id": @people[personid].id, "age": @people[personid].age}, 
            "book":{"title": @books[bookid].title, "author": @books[bookid].author}}
    array = []
    array.push(str1)
    write_json(array, RENTAL_FILE2)
    array3 = read_json(RENTAL_FILE2)
    array3.each do |rental|
      @rentals.push(rental)
    end
    write_json(@rentals, RENTAL_FILE)
    puts 'Rental created successfully'
    read_rentals
    puts
  end

  def list_rentals(id)
    puts
    @rentals.each do |rental|
      puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" By: #{rental['book']['author']}" if rental['person']['id'] == id
    end
    puts
  end

  def create_student(classroom,id, age, name, parent_permission)
    student = Student.new(classroom, id, age, name: name, parent_permission: parent_permission)
    puts
    @people.push(student)
    puts 'Person created successfully'
    puts
  end

  def create_teacher(id, age, name, specialization)
    teacher = Teacher.new(id, age, specialization, name: name)
    @people.push(teacher)
    puts
    puts 'Person created successfully'
    puts
  end
end
