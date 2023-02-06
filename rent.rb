require_relative 'app'

def rent
    app = App.new
puts 'Date (YYYY-MM-DD):'
  date = gets.chomp
  puts 'ID of the book:'
  book_id = gets.chomp.to_i
  book = app.books[book_id - 1] || (puts "Book with ID #{book_id} not found.")
  puts 'ID of the person:'
  person_id = gets.chomp.to_i
  person = app.people[person_id - 1] || (puts "Person with ID #{person_id} not found.")
  app.create_rental(date, book, person)
  puts 'Rental created successfully'
end
