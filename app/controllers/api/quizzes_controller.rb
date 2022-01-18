class Api::QuizzesController < ApplicationController
  before_action :validate_params_presence, only: [:create]

  def create
    category = QuizCategory.find_by(name: params[:quiz][:category].humanize)

    questions = get_questions(category)
    quiz = Quiz.create(difficulty: params[:quiz][:difficulty], questions: questions)
    if quiz.persisted?
      render json: { quiz: quiz }, status: :created
    else
      render_error(quiz.errors.full_messages.to_sentence,
                   :unprocessable_entity)
    end
  end

  private

  def render_error(message, status)
    render json: { message: message }, status: status
  end

  def validate_params_presence
    if params[:quiz].nil?
      render_error('Category and difficulty params are missing',
                   :unprocessable_entity)
    elsif params[:quiz][:category].nil?
      render_error('Category param is missing',
                   :unprocessable_entity)
    elsif params[:quiz][:difficulty].nil?
      render_error('Difficulty param is missing',
                   :unprocessable_entity)
    end
  end

  def quiz_params
    params.require(:quiz).permit(:difficulty)
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
