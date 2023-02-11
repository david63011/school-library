require_relative 'option'
require_relative 'libbook'
require_relative 'rent'
require_relative 'id'
require_relative 'people'

class Choice
  def initialize(app)
    @app = app
    @rent = GetRent.new(@app)
    @libbook = Libbook.new(@app)
    @people = People.new(@app)
    @list_rentals = ListRentals.new(@app)
  end

  def choice(uii)
    case uii
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @people.people
    when 4
      @libbook.libbook
    when 5
      @rent.rent
    when 6
      @list_rentals.id
    else
      puts 'Invalid option'
    end
  end
end
