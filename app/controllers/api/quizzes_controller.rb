class Api::QuizzesController < ApplicationController
  def create
    response = RestClient.get('https://opentdb.com/api_category.php')
    response_json = JSON.parse(response)
    category = response_json['trivia_categories'].detect { |category| category['name'] == params['quiz']['category'] }
    # https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple
  end
end
