RSpec.describe 'POST /api/quizzes' do
  before do
    WebMock.stub_request(:get, %r{opentdb.com/api.php})
           .to_return(status: 200, body: File.open(fixture_path + '/history_questions.json'))
  end

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

    it 'is expected to respond with an array of 10 questions' do
      expect(response_json['quiz']['questions'].count).to eq 10
    end
  end
end
