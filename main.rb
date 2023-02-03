require_relative 'app'

def main # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity
  app = App.new
  loop do # rubocop:disable Metrics/BlockLength
    puts 'Welcome to School Library App!'
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a persons id'
    puts '7 - Exit'
    puts
    print 'Enter your choice'
    option = gets.chomp.to_i
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      print "Enter the person's age: "
      age = gets.chomp.to_i
      print "Enter the person's name (optional): "
      name = gets.chomp
      app.create_person(age, name: name)
      puts 'Person created successfully'
    when 4
      puts 'Title:'
      title = gets.chomp
      puts 'Author:'
      author = gets.chomp
      app.create_book(title, author)
      puts 'Book created successfully'
    when 5
      puts 'Date (YYYY-MM-DD):'
      date = gets.chomp
      puts 'ID of the book:'
      book_id = gets.chomp.to_i
      book = app.books[book_id - 1] || (puts "Book with ID #{book_id} not found."
                                        next)
      puts 'ID of the person:'
      person_id = gets.chomp.to_i
      person = app.people[person_id - 1] || (puts "Person with ID #{person_id} not found."
                                             next)
      app.create_rental(date, book, person)
      puts 'Rental created successfully'
    when 6
      puts 'ID of person:'
      id = gets.chomp
      app.list_rentals_by_person_id(id)
    when 7
      puts 'Thank you for using this app!'
      break
    else
      puts 'That is not a valid option'
    end
    puts
  end
end
main
