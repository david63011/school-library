require_relative 'app'
def choice(uii)
  app = App.new
  case uii
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    people
  when 4
    libbook
  when 5
    id
  when 6
    rent
  else
    puts 'Invalid option'
  end
end
