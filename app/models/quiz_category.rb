class QuizCategory < ApplicationRecord
  validates_presence_of :api_id, :name
end
