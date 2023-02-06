require_relative 'option'
require_relative 'people'
require_relative 'libbook'
require_relative 'rent'
require_relative 'id'
require_relative 'choices'


def main
  loop do
    options
    userinput = gets.chomp.to_i
    if userinput == 7
      puts 'Thank you for using this app!'
      break
    else
      choices
    end
  end
end

main
