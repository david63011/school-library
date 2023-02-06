require_relative 'app'

def libbook
 app= App.new
  puts 'Title:'
  title = gets.chomp
  puts 'Author:'
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end
