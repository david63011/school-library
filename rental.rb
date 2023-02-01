class Rental
  attr_reader :date, :book, :person

  def initialize(date)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless book.rentals.include?(self)
    @date = date
  end
end
