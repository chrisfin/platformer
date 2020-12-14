class AccountsController < ApplicationController
	def new
		stripe_account = Stripe::Account.create({
		  country: 'US',
		  type: 'custom',
		  capabilities: {
		    card_payments: {
		      'requested': true,
		    },
		    transfers: {
		      'requested': true,
		    },
		  },
			tos_acceptance: {
		    date: Time.now.to_i,
		    ip: request.remote_ip,
			},
		})

		account_links = Stripe::AccountLink.create({
		  account: stripe_account.id,
		  refresh_url: 'https://example.com/reauth',
		  return_url: 'https://example.com/return',
		  type: 'account_onboarding',
		  collect: 'eventually_due',
		})

		account = Account.new
		account.stripe_id = stripe_account.id

		if account.save 
			redirect_to account_links.url
		else
			redirect_to root_url
		end	
	end

	def create
	end
end
