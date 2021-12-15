RSpec.describe 'POST /api/quizzes' do
  subject { response }

  describe 'with valid params' do
    before do
      post '/api/quizzes', params: {
        quiz: {
          category: 'History',
          difficulty: 'hard'
        }
      }
    end

    it { is_expected.to have_http_status :created }

    it 'is expected to respond with an array of quizzes' do
      expect(response_json['results']).to have_length 10
    end
  end
end
