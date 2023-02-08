require_relative 'spec_helper'
include LinksHelper

describe Person do
  person = Person.new(25, 25, name: 'jex')
  it 'should be an instance of Person' do
    expect(person).to be_an_instance_of(Person)
  end
  it 'should have a name' do
    expect(person.name).to eql('jex')
  end
  it 'should have an age' do
    expect(person.age).to eql(25)
  end
  it 'should have an id' do
    expect(person.id).to be_an_instance_of(Integer)
  end
end
