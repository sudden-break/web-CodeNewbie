class ShowNote < ActiveRecord::Base
  belongs_to :podcast
  validates :name, presence: true

end
