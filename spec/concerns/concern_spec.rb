require 'spec_helper'

describe 'Concern Examples' do
	it 'should be accessible in RSpec' do
		ModuleName.should be_a_kind_of(Module)
	end
end