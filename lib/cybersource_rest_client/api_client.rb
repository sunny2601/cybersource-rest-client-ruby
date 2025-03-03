=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'
require 'json'
require 'logger'
require 'tempfile'
require 'typhoeus'
require 'addressable/uri'

module CyberSource
  class ApiClient
    # The Configuration object holding settings to be used in the API client.
    attr_accessor :config

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    attr_accessor :default_headers

    # Defines the client ID for the SDK
    attr_accessor :client_id   

    # Defines the user-defined Accept Header Type
    attr_accessor :accept_header

    # Initializes the ApiClient
    # @option config [Configuration] Configuration for initializing the object, default to Configuration.default
    def initialize(config = Configuration.default)
      @config = config
      @user_agent = "Swagger-Codegen/#{VERSION}/ruby"
      @default_headers = {
        'User-Agent' => @user_agent
      }

      @client_id = 'cybs-rest-sdk-ruby-' + Gem.loaded_specs["cybersource_rest_client"].version.to_s
    end

    def set_user_defined_accept_header(accept_type)
      @accept_header = accept_type
    end

    def self.default
      @@default ||= ApiClient.new
    end

    # Call an API with given options.
    #
    # @return [Array<(Object, Fixnum, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code and response headers.
    def call_api(http_method, path, opts = {})
      unless @accept_header.nil? || @accept_header.empty?
        default_accept_header = ',' + (opts[:header_params])['Accept']
        default_accept_header = @accept_header + default_accept_header.sub(',' + @accept_header, '')
        opts[:header_params]['Accept'] = default_accept_header
      end

      request = build_request(http_method, path, opts)
      response = request.run

      if @config.debugging
        begin
        raise
            @config.logger.debug "HTTP response body ~BEGIN~\n#{response.body}\n~END~\n"
        rescue
            puts 'Cannot write to log'            
        end
      end

      unless response.success?
        if response.timed_out?
          fail ApiError.new('Connection timed out')
        elsif response.code == 0
          # Errors from libcurl will be made visible here
          fail ApiError.new(:code => 0,
                            :message => response.return_message)
        else
          fail ApiError.new(:code => response.code,
                            :response_headers => response.headers,
                            :response_body => response.body)
        end
      end

      if opts[:return_type]
        data = deserialize(response, opts[:return_type])
      else
        data = nil
      end
      return response.body, response.code, response.headers
    end

    # Builds the HTTP request
    #
    # @param [String] http_method HTTP method/verb (e.g. POST)
    # @param [String] path URL path (e.g. /account/new)
    # @option opts [Hash] :header_params Header parameters
    # @option opts [Hash] :query_params Query parameters
    # @option opts [Hash] :form_params Query parameters
    # @option opts [Object] :body HTTP body (JSON/XML)
    # @return [Typhoeus::Request] A Typhoeus Request
    def build_request(http_method, path, opts = {})
      url = build_request_url(path)
      body_params = opts[:body] || {}
      query_params = opts[:query_params] || {}
      if !query_params.empty?
        query_params = Addressable::URI.form_encode(query_params)
      end

      headers = opts[:header_params]
      if $merchantconfig_obj.authenticationType.upcase != Constants::AUTH_TYPE_MUTUAL_AUTH
        headers = CallAuthenticationHeader(http_method, path, body_params, headers, query_params)
      end
      http_method = http_method.to_sym.downcase
      header_params = headers.merge(@default_headers)
      form_params = opts[:form_params] || {}


      # set ssl_verifyhosts option based on @config.verify_ssl_host (true/false)
      _verify_ssl_host = @config.verify_ssl_host ? 2 : 0

      # client cert
      if $merchantconfig_obj.enableClientCert
        @config.cert_file = File.join($merchantconfig_obj.clientCertDirectory, $merchantconfig_obj.sslClientCert)
        @config.key_file = File.join($merchantconfig_obj.clientCertDirectory, $merchantconfig_obj.privateKey)
      end

      req_opts = {
        :method => http_method,
        :headers => header_params,
        :params => query_params,
        :params_encoding => @config.params_encoding,
        :timeout => @config.timeout,
        :ssl_verifypeer => @config.verify_ssl,
        :ssl_verifyhost => _verify_ssl_host,
        :sslcert => @config.cert_file,
        :sslkeypasswd => $merchantconfig_obj.sslKeyPassword || "",
        :sslkey => @config.key_file,
        :verbose => @config.debugging
      }

      # set custom cert, if provided
      req_opts[:cainfo] = @config.ssl_ca_cert if @config.ssl_ca_cert

      if [:post, :patch, :put, :delete].include?(http_method)
        req_body = build_request_body(header_params, form_params, opts[:body])
        req_opts.update :body => req_body
        if @config.debugging
            begin
            raise
                @config.logger.debug "HTTP request body param ~BEGIN~\n#{req_body}\n~END~\n"
            rescue
                puts 'Cannot write to log'
            end
        end
      end

      request = Typhoeus::Request.new(url, req_opts)
      download_file(request) if opts[:return_type] == 'File'
      request
    end
    # set merchantConfig 
    def set_configuration(config)
       require_relative '../AuthenticationSDK/core/MerchantConfig.rb'
       $merchantconfig_obj = Merchantconfig.new(config)
       @config.host = $merchantconfig_obj.requestHost
    end
    # Calling Authentication
    def CallAuthenticationHeader(http_method, path, body_params, header_params, query_params)
      require_relative '../AuthenticationSDK/core/Authorization.rb'
      require_relative '../AuthenticationSDK/authentication/payloadDigest/digest.rb'
      request_target = get_query_param(path, query_params)
      # Request Type. [Non-Editable]
      request_type = http_method.to_s
      log_obj = Log.new $merchantconfig_obj.logDirectory, $merchantconfig_obj.logFilename, $merchantconfig_obj.logSize, $merchantconfig_obj.enableLog
      # Set Request Type into the merchant config object.
      $merchantconfig_obj.requestType = request_type
      # Set Request Target into the merchant config object.
      $merchantconfig_obj.requestTarget = request_target
      # Construct the URL.
      url = Constants::HTTPS_URI_PREFIX + $merchantconfig_obj.requestHost + $merchantconfig_obj.requestTarget
      # set Request Json to Merchant config object
      $merchantconfig_obj.requestJsonData = body_params
      # Set URL into the merchant config object.
      $merchantconfig_obj.requestUrl = url
      # Calling APISDK, Apisdk.controller.
      gmtDateTime = DateTime.now.httpdate
      token = Authorization.new.getToken($merchantconfig_obj, gmtDateTime, log_obj)

      # Adding client ID header
      header_params['v-c-client-id'] = @client_id

      # Adding solution ID header
      # header_params['v-c-solution-id'] = $merchantconfig_obj.solutionId if !$merchantconfig_obj.solutionId.nil? && !$merchantconfig_obj.solutionId.empty?
      
      # HTTP header 'Accept' (if needed)
      if $merchantconfig_obj.authenticationType.upcase == Constants::AUTH_TYPE_HTTP
        # Appending headers for Get Connection
        header_params['v-c-merchant-id'] = $merchantconfig_obj.merchantId
        header_params['Date'] = gmtDateTime
        header_params['Host'] = $merchantconfig_obj.requestHost
        header_params['Signature'] = token
        if request_type == Constants::POST_REQUEST_TYPE || request_type == Constants::PUT_REQUEST_TYPE || request_type == Constants::PATCH_REQUEST_TYPE
          digest = DigestGeneration.new.generateDigest(body_params, log_obj)
          digest_payload = Constants::SHA256 + digest
          header_params['Digest'] = digest_payload
        end
      end
      if $merchantconfig_obj.authenticationType.upcase == Constants::AUTH_TYPE_JWT
        token = "Bearer " + token
        header_params['Authorization'] = token
      end
      if $merchantconfig_obj.authenticationType.upcase == Constants::AUTH_TYPE_OAUTH
        token = "Bearer " + token
        header_params['Authorization'] = token
      end
      # header_params.each do |key, value|
      #  log_obj.logger.info("#{key} : #{value}")
      # end
      return header_params
    end
    def get_query_param(path, query_params)
      request_target = ''
      if !query_params.empty?
        request_target = @config.base_path + path + '?' + query_params
      else
        request_target = @config.base_path + path
      end
      request_target
    end
    
    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    #   */*
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is application/json
    def json_mime?(mime)
      (mime == '*/*') || !(mime =~ /Application\/.*json(?!p)(;.*)?/i).nil?
    end

    # Deserialize the response to the given return type.
    #
    # @param [Response] response HTTP response
    # @param [String] return_type some examples: "User", "Array[User]", "Hash[String,Integer]"
    def deserialize(response, return_type)
      body = response.body

      # handle file downloading - return the File instance processed in request callbacks
      # note that response body is empty when the file is written in chunks in request on_body callback
      return @tempfile if return_type == 'File'

      return nil if body.nil? || body.empty?

      # return response body directly for String return type
      return body if return_type == 'String'

      # ensuring a default content type
      content_type = response.headers['Content-Type'] || 'application/json'

      fail "Content-Type is not supported: #{content_type}" unless json_mime?(content_type)

      begin
        data = JSON.parse("[#{body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w(String Date DateTime).include?(return_type)
          data = body
        else
          raise e
        end
      end

      convert_to_type data, return_type
    end

    # Convert data to the given return type.
    # @param [Object] data Data to be converted
    # @param [String] return_type Return type
    # @return [Mixed] Data in a particular type
    def convert_to_type(data, return_type)
      return nil if data.nil?
      case return_type
      when 'String'
        data.to_s
      when 'Integer'
        data.to_i
      when 'Float'
        data.to_f
      when 'BOOLEAN'
        data == true
      when 'DateTime'
        # parse date time (expecting ISO 8601 format)
        DateTime.parse data
      when 'Date'
        # parse date time (expecting ISO 8601 format)
        Date.parse data
      when 'Object'
        # generic object (usually a Hash), return directly
        data
      when /\AArray<(.+)>\z/
        # e.g. Array<Pet>
        sub_type = $1
        data.map { |item| convert_to_type(item, sub_type) }
      when /\AHash\<String, (.+)\>\z/
        # e.g. Hash<String, Integer>
        sub_type = $1
        {}.tap do |hash|
          data.each { |k, v| hash[k] = convert_to_type(v, sub_type) }
        end
      else
        # models, e.g. Pet
        CyberSource.const_get(return_type).new.tap do |model|
          model.build_from_hash data
        end
      end
    end

    # Save response body into a file in (the defined) temporary folder, using the filename
    # from the "Content-Disposition" header if provided, otherwise a random filename.
    # The response body is written to the file in chunks in order to handle files which
    # size is larger than maximum Ruby String or even larger than the maximum memory a Ruby
    # process can use.
    #
    # @see Configuration#temp_folder_path
    def download_file(request)
      tempfile = nil
      encoding = nil
      request.on_headers do |response|
        content_disposition = response.headers['Content-Disposition']
        if content_disposition && content_disposition =~ /filename=/i
          filename = content_disposition[/filename=['"]?([^'"\s]+)['"]?/, 1]
          prefix = sanitize_filename(filename)
        else
          prefix = 'download-'
        end
        prefix = prefix + '-' unless prefix.end_with?('-')
        encoding = response.body.encoding
        tempfile = Tempfile.open(prefix, @config.temp_folder_path, encoding: encoding)
        @tempfile = tempfile
      end
      request.on_body do |chunk|
        chunk.force_encoding(encoding)
        tempfile.write(chunk)
      end
      request.on_complete do |response|
        tempfile.close
        @config.logger.info "Temp file written to #{tempfile.path}, please copy the file to a proper folder "\
                            "with e.g. `FileUtils.cp(tempfile.path, '/new/file/path')` otherwise the temp file "\
                            "will be deleted automatically with GC. It's also recommended to delete the temp file "\
                            "explicitly with `tempfile.delete`"
      end
    end

    # Sanitize filename by removing path.
    # e.g. ../../sun.gif becomes sun.gif
    #
    # @param [String] filename the filename to be sanitized
    # @return [String] the sanitized filename
    def sanitize_filename(filename)
      filename.gsub(/.*[\/\\]/, '')
    end

    def build_request_url(path)
      # Add leading and trailing slashes to path
      path = "/#{path}".gsub(/\/+/, '/')
      Addressable::URI.encode(@config.base_url + path)
    end

    # Builds the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body(header_params, form_params, body)
      # http form
      if header_params['Content-Type'] == 'application/x-www-form-urlencoded' ||
          header_params['Content-Type'] == 'multipart/form-data'
        data = {}
        form_params.each do |key, value|
          case value
          when ::File, ::Array, nil
            # let typhoeus handle File, Array and nil parameters
            data[key] = value
          else
            data[key] = value.to_s
          end
        end
        JSON.parse(body).each do |key, value|
          case value
          when ::File, ::Array, nil
            # let typhoeus handle File, Array and nil parameters
            data[key] = value
          else
            data[key] = value.to_s
          end
        end
      elsif body
        data = body.is_a?(String) ? body : body.to_json
      else
        data = nil
      end
      data
    end

    # Update hearder and query params based on authentication settings.
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] query_params Query parameters
    # @param [String] auth_names Authentication scheme name
    def update_params_for_auth!(header_params, query_params, auth_names)
      Array(auth_names).each do |auth_name|
        auth_setting = @config.auth_settings[auth_name]
        next unless auth_setting
        case auth_setting[:in]
        when 'header' then header_params[auth_setting[:key]] = auth_setting[:value]
        when 'query'  then query_params[auth_setting[:key]] = auth_setting[:value]
        else fail ArgumentError, 'Authentication token must be in `query` of `header`'
        end
      end
    end

    # Sets user agent in HTTP header
    #
    # @param [String] user_agent User agent (e.g. swagger-codegen/ruby/1.0.0)
    def user_agent=(user_agent)
      @user_agent = user_agent
      @default_headers['User-Agent'] = @user_agent
    end

    # Return Accept header based on an array of accepts provided.
    # @param [Array] accepts array for Accept
    # @return [String] the Accept header (e.g. application/json)
    def select_header_accept(accepts)
      return nil if accepts.nil? || accepts.empty?
      # use JSON when present, otherwise use all of the provided
      json_accept = accepts.find { |s| json_mime?(s) }
      json_accept || accepts.join(',')
    end

    # Return Content-Type header based on an array of content types provided.
    # @param [Array] content_types array for Content-Type
    # @return [String] the Content-Type header  (e.g. application/json)
    def select_header_content_type(content_types)
      # use application/json by default
      return 'application/json' if content_types.nil? || content_types.empty?
      # use JSON when present, otherwise use the first one
      json_content_type = content_types.find { |s| json_mime?(s) }
      json_content_type || content_types.first
    end

    # Convert object (array, hash, object, etc) to JSON string.
    # @param [Object] model object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_http_body(model)
      return model if model.nil? || model.is_a?(String)
      local_body = nil
      if model.is_a?(Array)
        local_body = model.map { |m| object_to_hash(m) }
      else
        local_body = object_to_hash(model)
      end
      local_body.to_json
    end

    # Convert object(non-array) to hash.
    # @param [Object] obj object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_hash(obj)
      if obj.respond_to?(:to_hash)
        obj.to_hash
      else
        obj
      end
    end

    # Build parameter value according to the given collection format.
    # @param [String] collection_format one of :csv, :ssv, :tsv, :pipes and :multi
    def build_collection_param(param, collection_format)
      case collection_format
      when :csv
        param.join(',')
      when :ssv
        param.join(' ')
      when :tsv
        param.join("\t")
      when :pipes
        param.join('|')
      when :multi
        # return the array directly as typhoeus will handle it as expected
        param
      else
        fail "unknown collection format: #{collection_format.inspect}"
      end
    end
  end
end
