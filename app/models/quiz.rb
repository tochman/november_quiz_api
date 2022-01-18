class Quiz < ApplicationRecord
  validates_presence_of :difficulty, :questions
  serialize :questions, Array
end
