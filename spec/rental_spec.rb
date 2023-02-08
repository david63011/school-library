require_relative './spec_helper'

describe Rental do
  before :each do
    rental = Rental.new('2017-01-01', 'Bradley', 'Harry Potter')
  end
  it 'should have a date' do
    expect(rental.date).to eql('2017-01-01')
  end
  it 'should have a person' do
    expect(rental.person).to eql('Bradley')
  end
  it 'should have a book' do
    expect(rental.book).to eql('Harry Potter')
  end
end
