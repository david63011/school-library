require_relative 'spec_helper'

describe Teacher do
  teacher = Teacher.new(28, 28, 'History', name: 'pame')

  it 'should have a name' do
    expect(teacher.name).to eql('pame')
  end
  it 'should have an age' do
    expect(teacher.age).to eql(28)
  end

  it 'should have a specialization in History' do
    expect(teacher.specialization).to eql('History')
  end
  it 'should have a method to check if the teacher can use the services' do
    expect(teacher).to respond_to(:can_use_services?)
  end
end
