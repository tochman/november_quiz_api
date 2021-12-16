RSpec.describe QuizCategory, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :api_id }
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :api_id }
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:quiz_category)).to be_valid
    end
  end
end
