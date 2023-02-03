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
    @books.each do |book|
      puts book.title
    end
  end

  def list_people
    @people.each do |person|
      puts person.name
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

  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
  end

  def list_rentals_by_person_id(person_id)
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
