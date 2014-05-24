class Job < ActiveRecord::Base
  acts_as_taggable_on :location, :proglangs, :position
end
