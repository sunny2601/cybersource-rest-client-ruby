=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'spec_helper'
require 'json'

# Unit tests for CyberSource::TransactionBatchesApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TransactionBatchesApi' do
  before do
    # run before each test
    @instance = CyberSource::TransactionBatchesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TransactionBatchesApi' do
    it 'should create an instance of TransactionBatchesApi' do
      expect(@instance).to be_instance_of(CyberSource::TransactionBatchesApi)
    end
  end

  # unit tests for pts_v1_transaction_batches_get
  # Gets a list of batch files
  # Provide the search range
  # @param start_time Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ 
  # @param end_time Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ 
  # @param [Hash] opts the optional parameters
  # @return [PtsV1TransactionBatchesGet200Response]
  describe 'pts_v1_transaction_batches_get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for pts_v1_transaction_batches_id_get
  # Get individual batch file
  # Provide the search range
  # @param id The batch id assigned for the template.
  # @param [Hash] opts the optional parameters
  # @return [PtsV1TransactionBatchesIdGet200Response]
  describe 'pts_v1_transaction_batches_id_get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
