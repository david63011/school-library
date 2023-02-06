require_relative 'app'
require_relative 'option'
require_relative 'choices'

class All
  def initialize
    @app = App.new
    @choice = Choice.new(@app)
    @options = Option.new
  end

  def menu
    loop do
      @options.options
      userinput = gets.chomp.to_i
      if userinput == 7
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
