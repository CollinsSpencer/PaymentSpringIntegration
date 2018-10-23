require 'httparty'

class PagesController < ApplicationController
  @@priv_key = "test_8d979b6288268a23ee05aa47a7"

  def welcome
  end

  def checkout
  end

  def single
  #   Make a charge

  end

  def subscribe
  #   Subscribe
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

  # send the request to make the customer
  response = HTTParty.send(:post, url, parameters)
  puts response

  # @customer = Customer.new(name: "#{response['first_name']} #{response['last_name']}", email: response["email"], customer_id: response["id"])
  # puts @customer

  end
end
