class Api::PaymentsController < ApplicationController
  def create
    # 1. create a Stripe::Customer with Stripe API
    customer = Stripe::Customer.create(
      email: params[:payment][:email],
      source: params['payment'][:stripeToken]
    )
    # 2. create a Stripe::Charge
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params['payment'][:amount],
      currency: params['payment'][:currency],
      description: 'Payment for Quiz' # is this really required?
    )
    
    binding.pry
    # 3. respond with charge status (paid)
    render json: { paid: charge.paid }, status: :created
  end
end
