class GetRent
  def initialize(app)
    @app = app
  end

  def rent
    puts 'Select a book from the following list by number'
    @app.list_books
    print 'Book number: '
    book_number = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @app.list_people
    print 'Person number: '
    person_number = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    @app.create_rental(date, book_number, person_number)
  end
end
