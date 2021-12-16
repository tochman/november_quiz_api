class Api::QuizzesController < ApplicationController
  def create
    category = QuizCategory.find_by(name: params[:quiz][:category])

    questions = get_questions(category)
    quiz = Quiz.create(quiz_params.merge!(questions: questions))
    if quiz.persisted?
      render json: { quiz: quiz }, status: :created
    else
      render json: { quiz: quiz.errors.full_messages.to_sentance }, status: :unprocessable_entity
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:category, :difficulty)
  end

  def get_questions(category)
    api_quiz = RestClient.get('https://opentdb.com/api.php',
                              params: { amount: 10,
                                        category: category.api_id,
                                        difficulty: quiz_params[:difficulty],
                                        type: 'multiple' })
    JSON.parse(api_quiz.body).deep_symbolize_keys[:results]
  end
end
