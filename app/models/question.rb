# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  date            :datetime
#  topic           :string
#  flag            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tweet_id        :string
#  chat_session_id :integer
#

class Question < ActiveRecord::Base
  validates :tweet_id, uniqueness: true
  has_many :answers
  belongs_to :ChatSession
end
