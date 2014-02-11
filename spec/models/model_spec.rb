require 'spec_helper'

# NOTE:
# => You must run create / run migrations (rake -T).
# => This will allow for models to be instantiated.

describe 'Model Examples' do
	it 'should be accessible in RSpec' do
		ModelName.should be_a_kind_of(Class)
	end
end