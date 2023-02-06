require_relative 'app'

class ListRentals
  def initialize(app)
    @app = app
  end

  def id
    print 'Enter the Person ID:'
    id = gets.chomp.to_i
    @app.list_rentals_by_person_id(id)
  end
end
