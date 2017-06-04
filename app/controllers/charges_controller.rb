class ChargesController < ApplicationController

  def new
    @don = Don.find(params[:don_id])

  end

  def create
    @don = Don.find(params[:don_id])

    # Amount in cents
    @amount = @don.price.to_i * 100
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
