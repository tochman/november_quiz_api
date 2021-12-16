FactoryBot.define do
  factory :quiz do
    category { 'History' }
    difficulty { 'Hard' }
    questions do
      [{ 'category' => 'History',
         'type' => 'multiple',
         'difficulty' => 'hard',
         'question' =>
       'When did Canada leave the confederation to become their own nation?',
         'correct_answer' => 'July 1st, 1867',
         'incorrect_answers' =>
       ['July 1st, 1763', 'July 1st, 1832', 'July 1st, 1902'] }]
    end
  end
end
