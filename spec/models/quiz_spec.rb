RSpec.describe Quiz, type: :model do
  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:quiz)).to be_valid
    end
  end
end
