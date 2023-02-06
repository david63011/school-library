def people
  print "Enter the person's age: "
  age = gets.chomp.to_i
  print "Enter the person's name (optional): "
  name = gets.chomp
  app.create_person(age, name: name)
  puts 'Person created successfully'
end
