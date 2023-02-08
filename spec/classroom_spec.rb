require_relative 'spec_helper'

describe Classroom do
  classroom = Classroom.new('104')
  it 'should be an instance of Classroom' do
    expect(classroom).to be_an_instance_of(Classroom)
  end
  it 'should have a label' do
    expect(classroom.label).to eql('104')
  end
end
