RSpec.describe QuizCategory, type: :model do
  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:quiz_category)).to be_valid
    end
  end
end
