require_relative 'spec_helper'

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
  it 'should have a method can_use_services' do
    expect(person).to respond_to(:can_use_services?)
  end
  it 'should have of_age' do
    expect(person).to respond_to(:of_age?)
  end
  it 'should have a method correct_name' do
    expect(person).to respond_to(:correct_name)
  end
  it 'should have a method add_rental' do
    expect(person).to respond_to(:add_rental)
  end
end
