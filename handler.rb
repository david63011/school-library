require 'json'

module Handler 
  
  BOOK_FILE = 'books.json'
  PEOPLE_FILE = 'people.json'
  RENTAL_FILE = 'rentals.json'

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
  #CHECK IF FILE EXIST
  def check_book_file
    File.write(BOOK_FILE,'{}', mode: 'a') if !File.exist?(BOOK_FILE)
  end
  
  def check_people_file
    File.write(PEOPLE_FILE,'{}') if !File.exist?(PEOPLE_FILE)
  end  
  
  def check_rental_file
    File.write(RENTAL_FILE,'{}') if !File.exist?(RENTAL_FILE)
  end
  
  def read_json(file_path)
    return unless File.exist?(file_path)
    file = File.read(file_path)
    JSON.parse(file) if file
  end

  #Store Books
  def store_books(app)
    array = []
    array1 = read_json(BOOK_FILE)
    array1.each do |book|
      array.push(book)
    end
    app.books.each do |book|
        array.push(title: book.title, author: book.author)
    end
    write_json(array, BOOK_FILE)
  end

  #Read Books
  def read_books
    array = read_json(BOOK_FILE)
    array.each do |book|
      puts "Title: \"#{book['title']}\", Author: #{book['author']}"
    end
  end

  #Store people
  def store_people(app)
    array = []
    app.people.each do |person|
        array.push(class: person.class, name: person.name, age: person.age, id: person.id)
    end
    write_json(array, PEOPLE_FILE)
  end

  #Read people
  def read_people
    array = read_json(PEOPLE_FILE)
    array.each do |person|
      if person['class'] == 'Student'
          @people.push(Student.new(person['name'], person['age'], person['id']))
      elsif person['class'] == 'Teacher'
          @people.push(Teacher.new(person['name'], person['age'], person['id']))
      end
    end
  end

  #store rentals
  def store_rentals(app)
    array = []
    app.rentals.each do |rental|
        array.push(date: rental.date, person: rental.person, book: rental.book)
    end
    write_json(array, RENTAL_FILE)
  end

  #read rentals
  def read_rentals
    array = read_json(RENTAL_FILE)
    array.each do |rental|
        @rentals.push(Rental.new(rental['date'], rental['person'], rental['book']))
    end
  end
end