require_relative 'spec_helper'

describe Student do
  student = Student.new('C', 30, 30, name: 'David')

  it 'should be an instance of Student' do
    expect(student).to be_an_instance_of(Student)
  end
  it 'should have a name' do
    expect(student.name).to eql('David')
  end
  it 'should have rentals' do
    expect(student.rentals).to eql([])
  end
  it 'should have an age' do
    expect(student.age).to eql(30)
  end
  it 'shoild have a method play_hooky' do
    expect(student).to respond_to(:play_hooky)
  end
  it 'should have a classroom method' do
    expect(student).to respond_to(:classroom)
  end
end
