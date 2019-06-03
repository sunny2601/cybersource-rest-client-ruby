=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'uri'

module CyberSource
  class PayerAuthenticationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
	  @api_client.set_configuration(config)
    end
    # Check payer auth enrollment
    # This call verifies that the card is enrolled in a card authentication program.
    # @param check_payer_auth_enrollment_request 
    # @param [Hash] opts the optional parameters
    # @return [RiskV1AuthenticationsPost201Response]
    def check_payer_auth_enrollment(check_payer_auth_enrollment_request, opts = {})
      data, status_code, headers = check_payer_auth_enrollment_with_http_info(check_payer_auth_enrollment_request, opts)
      return data, status_code, headers
    end

    # Check payer auth enrollment
    # This call verifies that the card is enrolled in a card authentication program.
    # @param check_payer_auth_enrollment_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(RiskV1AuthenticationsPost201Response, Fixnum, Hash)>] RiskV1AuthenticationsPost201Response data, response status code and response headers
    def check_payer_auth_enrollment_with_http_info(check_payer_auth_enrollment_request, opts = {})
      
	  if @api_client.config.debugging
	  	begin
			raise
				@api_client.config.logger.debug 'Calling API: PayerAuthenticationApi.check_payer_auth_enrollment ...'
			rescue
				puts 'Cannot write to log'
			end
      end
      # verify the required parameter 'check_payer_auth_enrollment_request' is set
      if @api_client.config.client_side_validation && check_payer_auth_enrollment_request.nil?
        fail ArgumentError, "Missing the required parameter 'check_payer_auth_enrollment_request' when calling PayerAuthenticationApi.check_payer_auth_enrollment"
      end
      # resource path
      local_var_path = 'risk/v1/authentications'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(check_payer_auth_enrollment_request)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RiskV1AuthenticationsPost201Response')
      if @api_client.config.debugging
		begin
		raise
			@api_client.config.logger.debug "API called: PayerAuthenticationApi#check_payer_auth_enrollment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
		rescue
			puts 'Cannot write to log'
		end
	  end
      return data, status_code, headers
    end
    # Validate authentication results
    # This call retrieves and validates the authentication results from issuer and allows the merchant to proceed with processing the payment. 
    # @param request 
    # @param [Hash] opts the optional parameters
    # @return [RiskV1AuthenticationResultsPost201Response]
    def risk_v1_authentication_results_post(request, opts = {})
      data, status_code, headers = risk_v1_authentication_results_post_with_http_info(request, opts)
      return data, status_code, headers
    end

    # Validate authentication results
    # This call retrieves and validates the authentication results from issuer and allows the merchant to proceed with processing the payment. 
    # @param request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(RiskV1AuthenticationResultsPost201Response, Fixnum, Hash)>] RiskV1AuthenticationResultsPost201Response data, response status code and response headers
    def risk_v1_authentication_results_post_with_http_info(request, opts = {})
      
	  if @api_client.config.debugging
	  	begin
			raise
				@api_client.config.logger.debug 'Calling API: PayerAuthenticationApi.risk_v1_authentication_results_post ...'
			rescue
				puts 'Cannot write to log'
			end
      end
      # verify the required parameter 'request' is set
      if @api_client.config.client_side_validation && request.nil?
        fail ArgumentError, "Missing the required parameter 'request' when calling PayerAuthenticationApi.risk_v1_authentication_results_post"
      end
      # resource path
      local_var_path = 'risk/v1/authentication-results'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RiskV1AuthenticationResultsPost201Response')
      if @api_client.config.debugging
		begin
		raise
			@api_client.config.logger.debug "API called: PayerAuthenticationApi#risk_v1_authentication_results_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
		rescue
			puts 'Cannot write to log'
		end
	  end
      return data, status_code, headers
    end
  end
end
