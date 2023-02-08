require 'spec_helper.rb'

describe Book do
        book = Book.new('The Alchemist', 'Paulo Coelho')
    it 'should be an instance of Book' do
        expect(book).to be_an_instance_of(Book)
    end
    it 'should have a title' do
        expect(book.title).to eql('The Alchemist')
    end
  it 'should have an author' do
        expect(book.author).to eql('Paulo Coelho')
    end
    it 'should have an empty array of rentals' do
        expect(book.rentals).to eql([])
    end

    describe '#add_rental' do
        it 'should add a rental to the book' do
            book.add_rental('person', 'date')
            expect(book.rentals).to eql(['person', 'date', book])
        end
    end
    end