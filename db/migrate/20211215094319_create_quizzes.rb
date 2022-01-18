class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :difficulty
      t.text :questions

      t.timestamps
    end
  end
end
