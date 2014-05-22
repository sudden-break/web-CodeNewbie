class Resources < ActiveRecord::Base
  acts_as_taggable_on :formats, :proglangs
end