FactoryBot.define do
  factory :quiz do
    category { "Science: Computers" }
    type { "multiple" }
    difficulty { "hard" }
    question { "My question" }
    correct_answer { "RightAnswer" }
    incorrect_answers { ["MyString", "MyString2"] }
  end
end
