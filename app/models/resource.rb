class Resource < ActiveRecord::Base
  acts_as_taggable_on :formats, :proglangs
end
