require_relative 'spec_helper'
include LinksHelper

describe Nameable do
  nameable = Nameable.new
  it 'should have the method correct the name' do
    expect(nameable).to respond_to(:correct_name)
  end
end
