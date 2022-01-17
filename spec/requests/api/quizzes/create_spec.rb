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

  describe 'unsuccessfully' do
    describe 'due to missing params' do
      before do
        post '/api/quizzes', params: {}
      end

      it { is_expected.to have_http_status :unprocessable_entity }

      it 'is expected to respond with an error message' do
        expect(response_json['message']).to eq 'Category and difficulty params are missing'
      end
    end

    describe 'due to missing category' do
      before do
        post '/api/quizzes', params: {
          quiz: {
            difficulty: 'hard'
          }
        }
      end

      it { is_expected.to have_http_status :unprocessable_entity }

      it 'is expected to respond with an error message' do
        expect(response_json['message']).to eq 'Category param is missing'
      end
    end

    describe 'due to missing difficulty' do
      before do
        post '/api/quizzes', params: {
          quiz: {
            category: 'History'
          }
        }
      end

      it { is_expected.to have_http_status :unprocessable_entity }

      it 'is expected to respond with an error message' do
        expect(response_json['message']).to eq 'Difficulty param is missing'
      end
    end
  end
end
