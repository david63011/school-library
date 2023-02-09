require 'json'

module Handler
  BOOK_FILE = 'books.json'.freeze
  PEOPLE_FILE = 'people.json'.freeze
  RENTAL_FILE = 'rentals.json'.freeze
  RENTAL_FILE2 = 'rentals2.json'.freeze

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

  def check_rental_file2
    File.write(RENTAL_FILE2, '{}') unless File.exist?(RENTAL_FILE2)
  end

  def read_json(file_path)
    return unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  # Store Books
  def store_books(app)
    array = []
    app.books.each do |book|
      array.push(title: book.title, author: book.author)
    end
    write_json(array, BOOK_FILE)
  end

  # Read Books
  def read_books(app)
    array = read_json(BOOK_FILE)
    array.each do |book|
      book = Book.new(book['title'], book['author'])
      app.books.push(book)
    end
  end

  def read_books_rentals(books)
    array = read_json(BOOK_FILE)
    array.each do |book|
      books.push(title: book['title'], author: book['author'])
    end
  end

  # Store people
  def store_people_to_file(app)
    array = []
    app.people.each do |person|
      array.push(class: person.class, name: person.name, age: person.age, id: person.id)
    end
    write_json(array, PEOPLE_FILE)
  end

  # Read people
  def read_people(app)
    array = read_json(PEOPLE_FILE)
    array.each do |person|
      if person['class'] == 'Student'
        student = Student.new('C', person['id'], person['age'], name: person['name'], parent_permission: true)
        app.people.push(student)
      else
        teacher = Teacher.new(person['id'], person['age'], person['specialization'], name: person['name'])
        app.people.push(teacher)
      end
    end
  end

  def read_people_rentals(people)
    array = read_json(PEOPLE_FILE)
    array.each do |person|
      people.push(name: person['name'], ID: person['id'], age: person['age'])
    end
  end
end
