=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Riskv1authenticationsConsumerAuthenticationInformation
    # Data that documents and supports a specific authentication process. 
    attr_accessor :alternate_authentication_data

    # Date and time in UTC of the cardholder authentication. Format: YYYYMMDDHHMM 
    attr_accessor :alternate_authentication_date

    # Mechanism used by the cardholder to authenticate to the 3D Secure requestor. Possible values: - `01`: No authentication occurred - `02`: Login using merchant system credentials - `03`: Login using Federated ID - `04`: Login using FIDO Authenticator 
    attr_accessor :alternate_authentication_method

    # Payer authentication transaction identifier passed to link the check enrollment and validate authentication messages. **Note**: Required for Standard integration for enroll service. Required for Hybrid integration for validate service. 
    attr_accessor :authentication_transaction_id

    # Possible values: - `01`: No preference - `02`: No challenge request - `03`: Challenge requested (3D Secure requestor preference) - `04`: Challenge requested (mandate) - `05-79`: Reserved for EMVCo future use (values invalid until defined by EMVCo) - `80-99`: Reserved for DS use  For details, see `pa_challenge_code` field description in [CyberSource Payer Authentication Using the SCMP API.] (https://apps.cybersource.com/library/documentation/dev_guides/Payer_Authentication_SCMP_API/html/wwhelp/wwhimpl/js/html/wwhelp.htm) 
    attr_accessor :challenge_code

    # An alias that uniquely identifies the customer's account and credit card on file. Note This field is required if Tokenization is enabled in the merchant profile settings. 
    attr_accessor :customer_card_alias

    # Indicates that the card being used is the one designated as the primary payment card for purchase. Recommended for Discover ProtectBuy. 
    attr_accessor :default_card

    # An integer value greater than 1 indicating the max number of permitted authorizations for installment payments. **Note** This is required if the merchant and cardholder have agreed to installment payments. 
    attr_accessor :installment_total_count

    # Indicates whether the customer has opted in for marketing offers. Recommended for Discover ProtectBuy. 
    attr_accessor :marketing_opt_in

    # Indicates origin of the marketing offer. Recommended for Discover ProtectBuy. 
    attr_accessor :marketing_source

    # Merchant category code. **Important** Required only for Visa Secure transactions in Brazil. Do not use this request field for any other types of transactions. 
    attr_accessor :mcc

    # Category of the message for a specific use case. Possible values:  - `01`: PA- payment authentication - `02`: NPA- non-payment authentication - `03-79`: Reserved for EMVCo future use (values invalid until defined by EMVCo) - `80-99`: Reserved for DS use 
    attr_accessor :message_category

    # Non-Payer Authentication Indicator. Possible values: - `01`: Add card - `02`: Maintain card information - `03`: Cardholder verification for EMV token - `04-80` Reserved for EMVCo - `80-90` Reserved DS 
    attr_accessor :npa_code

    # Specifies the Brazilian payment account type used for the transaction. This field overrides other payment types that might be specified in the request. Use one of the following values for this field: - `NA`: Not applicable. Do not override other payment types that are specified in the request. - `CR`: Credit card. - `DB`: Debit card. - `VSAVR`: Visa Vale Refeicao - `VSAVA`: Visa Vale Alimentacao **Important** Required only for Visa Secure transactions in Brazil. Do not use this request field for any other types of transactions. 
    attr_accessor :override_payment_method

    # Specifies the product code, which designates the type of transaction. Specify one of the following values for this field: - AIR: Airline purchase Important Required for American Express SafeKey (U.S.). - `ACC`: Accommodation Rental - `ACF`: Account funding - `CHA`: Check acceptance - `DIG`: Digital Goods - `DSP`: Cash Dispensing - `GAS`: Fuel - `GEN`: General Retail - `LUX`: Luxury Retail - `PAL`: Prepaid activation and load - `PHY`: Goods or services purchase - `QCT`: Quasi-cash transaction - `REN`: Car Rental - `RES`: Restaurant - `SVC`: Services - `TBD`: Other - `TRA`: Travel **Important** Required for Visa Secure transactions in Brazil. Do not use this request field for any other types of transactions. 
    attr_accessor :product_code

    # Cardinal's directory server assigned 3DS Requestor ID value
    attr_accessor :requestor_id

    # Cardinal's directory server assigned 3DS Requestor Name value
    attr_accessor :requestor_name

    # Reference ID that corresponds to the device fingerprinting data that was collected previously. Note Required for Hybrid integration. 
    attr_accessor :reference_id

    # Transaction mode identifier. Identifies the channel from which the transaction originates. Possible values: - `MOTO` - MOTO (Mail Order Telephone Order) - `RETAIL` - Retail - `ECOMMERCE` - eCommerce - `MOBILE` - Mobile Device - `TABLET` - Tablet 
    attr_accessor :transaction_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'alternate_authentication_data' => :'alternateAuthenticationData',
        :'alternate_authentication_date' => :'alternateAuthenticationDate',
        :'alternate_authentication_method' => :'alternateAuthenticationMethod',
        :'authentication_transaction_id' => :'authenticationTransactionId',
        :'challenge_code' => :'challengeCode',
        :'customer_card_alias' => :'customerCardAlias',
        :'default_card' => :'defaultCard',
        :'installment_total_count' => :'installmentTotalCount',
        :'marketing_opt_in' => :'marketingOptIn',
        :'marketing_source' => :'marketingSource',
        :'mcc' => :'mcc',
        :'message_category' => :'messageCategory',
        :'npa_code' => :'npaCode',
        :'override_payment_method' => :'overridePaymentMethod',
        :'product_code' => :'productCode',
        :'requestor_id' => :'requestorId',
        :'requestor_name' => :'requestorName',
        :'reference_id' => :'referenceId',
        :'transaction_mode' => :'transactionMode'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'alternate_authentication_data' => :'String',
        :'alternate_authentication_date' => :'String',
        :'alternate_authentication_method' => :'String',
        :'authentication_transaction_id' => :'String',
        :'challenge_code' => :'String',
        :'customer_card_alias' => :'String',
        :'default_card' => :'BOOLEAN',
        :'installment_total_count' => :'Integer',
        :'marketing_opt_in' => :'BOOLEAN',
        :'marketing_source' => :'String',
        :'mcc' => :'String',
        :'message_category' => :'String',
        :'npa_code' => :'String',
        :'override_payment_method' => :'String',
        :'product_code' => :'String',
        :'requestor_id' => :'String',
        :'requestor_name' => :'String',
        :'reference_id' => :'String',
        :'transaction_mode' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'alternateAuthenticationData')
        self.alternate_authentication_data = attributes[:'alternateAuthenticationData']
      end

      if attributes.has_key?(:'alternateAuthenticationDate')
        self.alternate_authentication_date = attributes[:'alternateAuthenticationDate']
      end

      if attributes.has_key?(:'alternateAuthenticationMethod')
        self.alternate_authentication_method = attributes[:'alternateAuthenticationMethod']
      end

      if attributes.has_key?(:'authenticationTransactionId')
        self.authentication_transaction_id = attributes[:'authenticationTransactionId']
      end

      if attributes.has_key?(:'challengeCode')
        self.challenge_code = attributes[:'challengeCode']
      end

      if attributes.has_key?(:'customerCardAlias')
        self.customer_card_alias = attributes[:'customerCardAlias']
      end

      if attributes.has_key?(:'defaultCard')
        self.default_card = attributes[:'defaultCard']
      end

      if attributes.has_key?(:'installmentTotalCount')
        self.installment_total_count = attributes[:'installmentTotalCount']
      end

      if attributes.has_key?(:'marketingOptIn')
        self.marketing_opt_in = attributes[:'marketingOptIn']
      end

      if attributes.has_key?(:'marketingSource')
        self.marketing_source = attributes[:'marketingSource']
      end

      if attributes.has_key?(:'mcc')
        self.mcc = attributes[:'mcc']
      end

      if attributes.has_key?(:'messageCategory')
        self.message_category = attributes[:'messageCategory']
      end

      if attributes.has_key?(:'npaCode')
        self.npa_code = attributes[:'npaCode']
      end

      if attributes.has_key?(:'overridePaymentMethod')
        self.override_payment_method = attributes[:'overridePaymentMethod']
      end

      if attributes.has_key?(:'productCode')
        self.product_code = attributes[:'productCode']
      end

      if attributes.has_key?(:'requestorId')
        self.requestor_id = attributes[:'requestorId']
      end

      if attributes.has_key?(:'requestorName')
        self.requestor_name = attributes[:'requestorName']
      end

      if attributes.has_key?(:'referenceId')
        self.reference_id = attributes[:'referenceId']
      end

      if attributes.has_key?(:'transactionMode')
        self.transaction_mode = attributes[:'transactionMode']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@alternate_authentication_data.nil? && @alternate_authentication_data.to_s.length > 2048
        invalid_properties.push('invalid value for "alternate_authentication_data", the character length must be smaller than or equal to 2048.')
      end

      if !@alternate_authentication_date.nil? && @alternate_authentication_date.to_s.length > 14
        invalid_properties.push('invalid value for "alternate_authentication_date", the character length must be smaller than or equal to 14.')
      end

      if !@authentication_transaction_id.nil? && @authentication_transaction_id.to_s.length > 20
        invalid_properties.push('invalid value for "authentication_transaction_id", the character length must be smaller than or equal to 20.')
      end

      if !@customer_card_alias.nil? && @customer_card_alias.to_s.length > 128
        invalid_properties.push('invalid value for "customer_card_alias", the character length must be smaller than or equal to 128.')
      end

      if !@marketing_source.nil? && @marketing_source.to_s.length > 40
        invalid_properties.push('invalid value for "marketing_source", the character length must be smaller than or equal to 40.')
      end

      if @mcc.nil?
        invalid_properties.push('invalid value for "mcc", mcc cannot be nil.')
      end

      if @mcc.to_s.length > 4
        invalid_properties.push('invalid value for "mcc", the character length must be smaller than or equal to 4.')
      end

      if !@npa_code.nil? && @npa_code.to_s.length > 2
        invalid_properties.push('invalid value for "npa_code", the character length must be smaller than or equal to 2.')
      end

      if !@product_code.nil? && @product_code.to_s.length > 3
        invalid_properties.push('invalid value for "product_code", the character length must be smaller than or equal to 3.')
      end

      if !@requestor_id.nil? && @requestor_id.to_s.length > 35
        invalid_properties.push('invalid value for "requestor_id", the character length must be smaller than or equal to 35.')
      end

      if !@requestor_name.nil? && @requestor_name.to_s.length > 40
        invalid_properties.push('invalid value for "requestor_name", the character length must be smaller than or equal to 40.')
      end

      if @reference_id.nil?
        invalid_properties.push('invalid value for "reference_id", reference_id cannot be nil.')
      end

      if @reference_id.to_s.length > 50
        invalid_properties.push('invalid value for "reference_id", the character length must be smaller than or equal to 50.')
      end

      if @transaction_mode.nil?
        invalid_properties.push('invalid value for "transaction_mode", transaction_mode cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@alternate_authentication_data.nil? && @alternate_authentication_data.to_s.length > 2048
      return false if !@alternate_authentication_date.nil? && @alternate_authentication_date.to_s.length > 14
      return false if !@authentication_transaction_id.nil? && @authentication_transaction_id.to_s.length > 20
      return false if !@customer_card_alias.nil? && @customer_card_alias.to_s.length > 128
      return false if !@marketing_source.nil? && @marketing_source.to_s.length > 40
      return false if @mcc.nil?
      return false if @mcc.to_s.length > 4
      return false if !@npa_code.nil? && @npa_code.to_s.length > 2
      return false if !@product_code.nil? && @product_code.to_s.length > 3
      return false if !@requestor_id.nil? && @requestor_id.to_s.length > 35
      return false if !@requestor_name.nil? && @requestor_name.to_s.length > 40
      return false if @reference_id.nil?
      return false if @reference_id.to_s.length > 50
      return false if @transaction_mode.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] alternate_authentication_data Value to be assigned
    def alternate_authentication_data=(alternate_authentication_data)
      if !alternate_authentication_data.nil? && alternate_authentication_data.to_s.length > 2048
        fail ArgumentError, 'invalid value for "alternate_authentication_data", the character length must be smaller than or equal to 2048.'
      end

      @alternate_authentication_data = alternate_authentication_data
    end

    # Custom attribute writer method with validation
    # @param [Object] alternate_authentication_date Value to be assigned
    def alternate_authentication_date=(alternate_authentication_date)
      if !alternate_authentication_date.nil? && alternate_authentication_date.to_s.length > 14
        fail ArgumentError, 'invalid value for "alternate_authentication_date", the character length must be smaller than or equal to 14.'
      end

      @alternate_authentication_date = alternate_authentication_date
    end

    # Custom attribute writer method with validation
    # @param [Object] authentication_transaction_id Value to be assigned
    def authentication_transaction_id=(authentication_transaction_id)
      if !authentication_transaction_id.nil? && authentication_transaction_id.to_s.length > 20
        fail ArgumentError, 'invalid value for "authentication_transaction_id", the character length must be smaller than or equal to 20.'
      end

      @authentication_transaction_id = authentication_transaction_id
    end

    # Custom attribute writer method with validation
    # @param [Object] customer_card_alias Value to be assigned
    def customer_card_alias=(customer_card_alias)
      if !customer_card_alias.nil? && customer_card_alias.to_s.length > 128
        fail ArgumentError, 'invalid value for "customer_card_alias", the character length must be smaller than or equal to 128.'
      end

      @customer_card_alias = customer_card_alias
    end

    # Custom attribute writer method with validation
    # @param [Object] marketing_source Value to be assigned
    def marketing_source=(marketing_source)
      if !marketing_source.nil? && marketing_source.to_s.length > 40
        fail ArgumentError, 'invalid value for "marketing_source", the character length must be smaller than or equal to 40.'
      end

      @marketing_source = marketing_source
    end

    # Custom attribute writer method with validation
    # @param [Object] mcc Value to be assigned
    def mcc=(mcc)
      if mcc.nil?
        fail ArgumentError, 'mcc cannot be nil'
      end

      if mcc.to_s.length > 4
        fail ArgumentError, 'invalid value for "mcc", the character length must be smaller than or equal to 4.'
      end

      @mcc = mcc
    end

    # Custom attribute writer method with validation
    # @param [Object] npa_code Value to be assigned
    def npa_code=(npa_code)
      if !npa_code.nil? && npa_code.to_s.length > 2
        fail ArgumentError, 'invalid value for "npa_code", the character length must be smaller than or equal to 2.'
      end

      @npa_code = npa_code
    end

    # Custom attribute writer method with validation
    # @param [Object] product_code Value to be assigned
    def product_code=(product_code)
      if !product_code.nil? && product_code.to_s.length > 3
        fail ArgumentError, 'invalid value for "product_code", the character length must be smaller than or equal to 3.'
      end

      @product_code = product_code
    end

    # Custom attribute writer method with validation
    # @param [Object] requestor_id Value to be assigned
    def requestor_id=(requestor_id)
      if !requestor_id.nil? && requestor_id.to_s.length > 35
        fail ArgumentError, 'invalid value for "requestor_id", the character length must be smaller than or equal to 35.'
      end

      @requestor_id = requestor_id
    end

    # Custom attribute writer method with validation
    # @param [Object] requestor_name Value to be assigned
    def requestor_name=(requestor_name)
      if !requestor_name.nil? && requestor_name.to_s.length > 40
        fail ArgumentError, 'invalid value for "requestor_name", the character length must be smaller than or equal to 40.'
      end

      @requestor_name = requestor_name
    end

    # Custom attribute writer method with validation
    # @param [Object] reference_id Value to be assigned
    def reference_id=(reference_id)
      if reference_id.nil?
        fail ArgumentError, 'reference_id cannot be nil'
      end

      if reference_id.to_s.length > 50
        fail ArgumentError, 'invalid value for "reference_id", the character length must be smaller than or equal to 50.'
      end

      @reference_id = reference_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          alternate_authentication_data == o.alternate_authentication_data &&
          alternate_authentication_date == o.alternate_authentication_date &&
          alternate_authentication_method == o.alternate_authentication_method &&
          authentication_transaction_id == o.authentication_transaction_id &&
          challenge_code == o.challenge_code &&
          customer_card_alias == o.customer_card_alias &&
          default_card == o.default_card &&
          installment_total_count == o.installment_total_count &&
          marketing_opt_in == o.marketing_opt_in &&
          marketing_source == o.marketing_source &&
          mcc == o.mcc &&
          message_category == o.message_category &&
          npa_code == o.npa_code &&
          override_payment_method == o.override_payment_method &&
          product_code == o.product_code &&
          requestor_id == o.requestor_id &&
          requestor_name == o.requestor_name &&
          reference_id == o.reference_id &&
          transaction_mode == o.transaction_mode
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [alternate_authentication_data, alternate_authentication_date, alternate_authentication_method, authentication_transaction_id, challenge_code, customer_card_alias, default_card, installment_total_count, marketing_opt_in, marketing_source, mcc, message_category, npa_code, override_payment_method, product_code, requestor_id, requestor_name, reference_id, transaction_mode].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = CyberSource.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end