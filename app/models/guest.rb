class Guest < ActiveRecord::Base
  belongs_to :podcast
  has_many :picks
end
