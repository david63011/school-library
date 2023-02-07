require 'json'

module Handler
  BOOK_FILE = 'books.json'.freeze
  PEOPLE_FILE = 'people.json'.freeze
  RENTAL_FILE = 'rentals.json'.freeze

  def write_json(array, file_path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '

    }
    File.write(file_path, JSON.generate(array, opts))
  end

  # CHECK IF FILE EXIST
  def check_book_file
    File.write(BOOK_FILE, '{}', mode: 'a') unless File.exist?(BOOK_FILE)
  end

  def check_people_file
    File.write(PEOPLE_FILE, '{}') unless File.exist?(PEOPLE_FILE)
  end

  def check_rental_file
    File.write(RENTAL_FILE, '{}') unless File.exist?(RENTAL_FILE)
  end

  def read_json(file_path)
    return unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file) if file
  end

  # Store Books
  def store_books(app)
    array = []
    array1 = read_json(BOOK_FILE)
    array1.each do |book|
      array.push(book)
    end
    app.books.each do |book|
      array.push(title: book.title, author: book.author)
    end
    newArr = []
    write_json(array, BOOK_FILE)
  end

  # Read Books
  def read_books
    array = read_json(BOOK_FILE)
    array.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}"
    end
  end

  # Store people
  def store_people_to_file(app)
    array = []
    array1 = read_json(PEOPLE_FILE)
    array1.each do |person|
      array.push(person)
    end
    app.people.each do |person|
      array.push(class: person.class, name: person.name, age: person.age, id: person.id)
    end
    write_json(array, PEOPLE_FILE)
  end

  # Read people
  def read_people
    array = read_json(PEOPLE_FILE)
    array.each_with_index do |person, index|
      puts "#{index}) [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  # store rentals
  def store_rentals(app)
    array = []
    array1 = read_json(RENTAL_FILE)
    array1.each do |rental|
      array.push(rental)
    end
    app.rentals.each do |rental|
      array.push(date: rental.date, person: rental.person, book: rental.book)
    end
    write_json(array, RENTAL_FILE)
  end

  # read rentals
  def read_rentals
    array = read_json(RENTAL_FILE)
    array.each do |rental|
      puts "Date: #{rental['date']}, Book \"#{rental.book['title']}\" by #{rental.book['author']}"
    end
  end
end
