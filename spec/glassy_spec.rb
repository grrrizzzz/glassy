require 'spec_helper'

RSpec.describe Glassy do
  it 'has a version number' do
    expect(Glassy::VERSION).not_to be nil
  end

  it 'returns a glassy location' do
    expect(Glass::Location.where?).to be 'Here!'
  end
end
