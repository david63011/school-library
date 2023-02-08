require_relative 'app'
require_relative 'option'
require_relative 'choices'
require_relative 'handler'

class All
  def initialize
    @app = App.new
    @choice = Choice.new(@app)
    @options = Option.new
  end

  include Handler

  def menu
    check_book_file
    check_people_file
    check_rental_file
    check_rental_file2
    read_books(@app)
    read_people(@app)
    @app.read_rentals
    loop do
      @options.options
      userinput = gets.chomp.to_i
      if userinput == 7
        store_books(@app)
        store_people_to_file(@app)
        puts 'Thank you for using this app!'
        break
      else
        @choice.choice(userinput)
      end
    end
  end
end

def main
  all = All.new
  all.menu
end

main
