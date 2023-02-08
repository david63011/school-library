require_relative './spec_helper'

describe Teacher do
  teacher = Teacher.new(28, name: 'pame')


  it 'should have a name' do
    expect(teacher.name).to eql('pame')
  end
  it 'should have an age' do
    expect(teacher.age).to eql(28)
  end

  it 'should have a specialization in History' do
    expect(teacher.specialization).to eql('History')
  end
end
