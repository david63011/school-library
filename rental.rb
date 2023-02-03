require_relative 'book'
require_relative 'person'
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless book.rentals.include?(self)
    @date = date
    book.add_rental(person, date)
    person.add_rental(person, date)
  end
end
