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
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id}"
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
    rental = Rental.new(date, @people[person], @books[book])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id(person_id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
