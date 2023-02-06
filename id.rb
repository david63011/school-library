def id
  puts 'ID of person:'
  id = gets.chomp
  app.list_rentals_by_person_id(id)
end
