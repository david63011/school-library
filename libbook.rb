class Libbook
  def initialize(app)
    @app = app
  end

  def libbook
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
    puts 'Book created successfully'
  end
end