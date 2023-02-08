require_relative './spec_helper'

describe CapitalizeDecorator do
    before :each do
       capitalize_decorator = CapitalizeDecorator.new('pame')
    end
    it 'should be an instance of CapitalizeDecorator' do
        expect(capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
    end
    it 'should return a capitalized string' do
        expect(capitalize_decorator.capitalize).to eql('Pame')
    end
end