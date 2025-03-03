=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'spec_helper'
require 'json'

# Unit tests for CyberSource::CustomerPaymentInstrumentApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CustomerPaymentInstrumentApi' do
  before do
    # run before each test
    @instance = CyberSource::CustomerPaymentInstrumentApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CustomerPaymentInstrumentApi' do
    it 'should create an instance of CustomerPaymentInstrumentApi' do
      expect(@instance).to be_instance_of(CyberSource::CustomerPaymentInstrumentApi)
    end
  end

  # unit tests for delete_customer_payment_instrument
  # Delete a Customer Payment Instrument
  # @param customer_token_id The TokenId of a customer.
  # @param payment_instrument_token_id The TokenId of a payment instrument.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :profile_id The id of a profile containing user specific TMS configuration.
  # @return [nil]
  describe 'delete_customer_payment_instrument test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_customer_payment_instrument
  # Retrieve a Customer Payment Instrument
  # @param customer_token_id The TokenId of a customer.
  # @param payment_instrument_token_id The TokenId of a payment instrument.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :profile_id The id of a profile containing user specific TMS configuration.
  # @return [Tmsv2customersEmbeddedDefaultPaymentInstrument]
  describe 'get_customer_payment_instrument test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_customer_payment_instruments_list
  # List Payment Instruments for a Customer
  # @param customer_token_id The TokenId of a customer.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :profile_id The id of a profile containing user specific TMS configuration.
  # @option opts [Integer] :offset Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  # @option opts [Integer] :limit The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
  # @return [PaymentInstrumentList]
  describe 'get_customer_payment_instruments_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_customers_payment_instrument
  # Update a Customer Payment Instrument
  # @param customer_token_id The TokenId of a customer.
  # @param payment_instrument_token_id The TokenId of a payment instrument.
  # @param patch_customer_payment_instrument_request 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :profile_id The id of a profile containing user specific TMS configuration.
  # @option opts [String] :if_match Contains an ETag value from a GET request to make the request conditional.
  # @return [Tmsv2customersEmbeddedDefaultPaymentInstrument]
  describe 'patch_customers_payment_instrument test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_customer_payment_instrument
  # Create a Customer Payment Instrument
  # Include an existing TMS Customer &amp; Instrument Identifier token id in the request. * A Customer token can be created by calling: **POST */tms/v2/customers*** * An Instrument Identifier token can be created by calling: **POST */tms/v1/instrumentidentifiers*** 
  # @param customer_token_id The TokenId of a customer.
  # @param post_customer_payment_instrument_request 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :profile_id The id of a profile containing user specific TMS configuration.
  # @return [Tmsv2customersEmbeddedDefaultPaymentInstrument]
  describe 'post_customer_payment_instrument test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
