RSpec.describe Quiz, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :difficulty }
    it { is_expected.to have_db_column :questions }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :category }
    it { is_expected.to validate_presence_of :difficulty }
    it { is_expected.to validate_presence_of :questions }
  end

  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:quiz)).to be_valid
    end
  end
end
