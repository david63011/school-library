require 'json'

module Handler 
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
    # READER

      def read_json(file_path)
        return unless File.exist?(file_path)
    file = File.read(file_path)
        JSON.parse(file)
      end
      #Stores
def store_books 
        array = []
        @books.each do |book|
            array.push(title: book.title, author: book.author)
        end
        write_json(array, 'books.json')
      end

     def read_books
        array = read_json('books.json')
        array.each do |book|
            @books.push(Book.new(book['title'], book['author']))
        end

         def store_people
        array = []
        @people.each do |person|
            array.push(class: person.class, name: person.name, age: person.age, id: person.id)
        end
        write_json(array, 'people.json')

        def read_people
        array = read_json('people.json')
        array.each do |person|
            if person['class'] == 'Student'
                @people.push(Student.new(person['name'], person['age'], person['id']))
            elsif person['class'] == 'Teacher'
                @people.push(Teacher.new(person['name'], person['age'], person['id']))
            end
        end
      end
     def store_rentals
        array = []
        @rentals.each do |rental|
            array.push(date: rental.date, person: rental.person, book: rental.book)
        end
        write_json(array, 'rentals.json')
      end

        def read_rentals
        array = read_json('rentals.json')
        array.each do |rental|
            @rentals.push(Rental.new(rental['date'], rental['person'], rental['book']))
        end
      end
end