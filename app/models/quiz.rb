class Quiz < ApplicationRecord
  validates_presence_of :category, :difficulty, :questions
  serialize :questions, Array
end
