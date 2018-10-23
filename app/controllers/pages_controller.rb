require 'httparty'

class PagesController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  @@priv_key = "test_8d979b6288268a23ee05aa47a7"
  @@plan_id = "151054"
  @@single_charge_amount = 1000

  def welcome
  end

  def checkout
  end

  def confirmation
  end

  def single
    # Make a charge
    parameters = {
      basic_auth: {
        username: @@priv_key, # api key
        password: '' # leave password blank
      },
      body: {
        token: params[:id], # here's the token
        amount: @@single_charge_amount,
        email_address: params[:email]
      }
    }
    url = 'https://api.paymentspring.com/api/v1/charge'
    response = HTTParty.send(:post, url, parameters)
    puts response
  end

  def subscribe
    # Make a customer
    parameters = {
      basic_auth: {
        username: @@priv_key, # api key
        password: '' # leave password blank
      },
      body: {
        token: params[:id], # here's the token
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email]
      }
    }
    url = 'https://api.paymentspring.com/api/v1/customers'
    response = HTTParty.send(:post, url, parameters)
    puts "Create Customer Response"
    puts response

    # Store customer in DB
    @customer = Customer.new(
      first_name: response["first_name"],
      last_name: response["last_name"],
      customer_id: response["id"],
      email: response["email"],
      address_1: response["address_1"],
      addres_2: response["address_2"],
      city: response["city"],
      state: response["state"],
      zip: response["zip"],
      phone: response["phone"],
      country: response["country"],
      card_type: response["card_type"],
      last_4: response["last_4"],
      card_exp_month: response["card_exp_month"],
      card_exp_year: response["card_exp_year"],
      default_method_id: response["default_method_id"]
    )

    # Subscribe Customer
    subscription_parameters = {
      basic_auth: {
        username: @@priv_key, # api key
        password: '' # leave password blank
      }
    }
    subscription_url = "https://api.paymentspring.com/api/v1/plans/#{@@plan_id}/subscription/#{@customer.customer_id}"
    subscription_response = HTTParty.send(:post, subscription_url, subscription_parameters)
    puts subscription_response
  end
end
