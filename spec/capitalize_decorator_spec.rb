require_relative 'spec_helper'

describe CapitalizeDecorator do
  capitalize_decorator = CapitalizeDecorator.new('pame')
  it 'should be an instance of CapitalizeDecorator' do
    expect(capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
  end
end
