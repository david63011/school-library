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
      def store_books 
        array = []
        @books.each do |book|
            array.push(title: book.title, author: book.author)
        end
        write_json(array, 'books.json')
      end
        def store_people
        array = []
        @people.each do |person|
            array.push(class: person.class, name: person.name, age: person.age, id: person.id)
        end
        write_json(array, 'people.json')
      end
        def store_rentals
        array = []
        @rentals.each do |rental|
            array.push(date: rental.date, person: rental.person, book: rental.book)
        end
        write_json(array, 'rentals.json')
      end
end