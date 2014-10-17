# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  date        :datetime
#  topic       :string
#  flag        :string
#  tweet_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  author      :string
#  author_img  :string
#

class Answer < ActiveRecord::Base
  validates :tweet_id, uniqueness: true
  belongs_to :question
end
