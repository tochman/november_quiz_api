RSpec.describe 'POST /api/payments' do
  let(:stripe_helper) {StripeMock.create_test_helper}
  let(:valid_token) {stripe_helper.generate_card_token}
  subject { response }
  before do
    post '/api/payments', params: { payment: {
      stripeToken: valid_token,
      currency: 'sek',
      amount: 1000,
      email: 'random@guy.com'
    } }
  end

  it { is_expected.to have_http_status 201 }

  it 'is expected to return transaction info that includes paid: true' do
    expected_response = { "paid": true }
    expect(response_json).to eq expected_response
  end
end
