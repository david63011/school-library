require_relative 'spec_helper'
require 'vine'
include LinksHelper

class Rentals
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @rentals = [{ date: date, person: person, book: book }]
  end
end

describe Rentals do
  rental = Rentals.new('2017-01-01', { name: 'Bradley', id: 12, age: 12 },
                       { title: 'Harry Potter', author: 'Mark Bladley' })
  it 'should have a date' do
    expect(rental.date).to eql('2017-01-01')
  end
  it 'should have a person' do
    expect(rental.person.access('name')).to match('Bradley')
  end
  it 'should have a book' do
    expect(rental.book.access('title')).to match('Harry Potter')
  end
end
