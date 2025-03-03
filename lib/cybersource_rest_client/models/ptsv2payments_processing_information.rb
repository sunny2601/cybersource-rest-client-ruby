=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Ptsv2paymentsProcessingInformation
    # Array of actions (one or more) to be included in the payment to invoke bundled serviecs along with payment.  Possible values are one or more of follows:   - `DECISION_SKIP`: Use this when you want to skip Decision Manager service(s).   - `TOKEN_CREATE`: Use this when you want to create a token from the card/bank data in your payment request.   - `CONSUMER_AUTHENTICATION`: Use this when you want to check if a card is enrolled in Payer Authentioncation along with your payment request.   - `VALIDATE_CONSUMER_AUTHENTICATION`: Use this after you acquire a Payer Authentioncation result that needs to be included for your payment request. 
    attr_accessor :action_list

    # CyberSource tokens types you are performing a create on. If not supplied the default token type for the merchants token vault will be used.  Valid values: - customer - paymentInstrument - instrumentIdentifier - shippingAddress 
    attr_accessor :action_token_types

    # Indicates whether to also include a capture  in the submitted authorization request or not.  Possible values: - `true`: Include a capture with an authorization request. - `false`: (default) Do not include a capture with an authorization request.  #### Used by **Authorization and Capture** Optional field. 
    attr_accessor :capture

    # Value that identifies the processor/acquirer to use for the transaction. This value is supported only for **CyberSource through VisaNet**.  Contact CyberSource Customer Support to get the value for this field. 
    attr_accessor :processor_id

    # Payouts transaction type. Required for OCT transactions. This field is a pass-through, which means that CyberSource does not verify the value or modify it in any way before sending it to the processor. **Note** When the request includes this field, this value overrides the information in your CyberSource account.  For valid values, see the `invoiceHeader_businessApplicationID` field description in [Payouts Using the Simple Order API.](http://apps.cybersource.com/library/documentation/dev_guides/payouts_SO/Payouts_SO_API.pdf) 
    attr_accessor :business_application_id

    # Type of transaction. Some payment card companies use this information when determining discount rates.  #### Used by **Authorization** Required payer authentication transactions; otherwise, optional. **Credit** Required for standalone credits on Chase Paymentech solutions; otherwise, optional.  The list of valid values in this field depends on your processor. See Appendix I, \"Commerce Indicators,\" on page 441 of the Cybersource Credit Card Guide.  #### Ingenico ePayments When you omit this field for Ingenico ePayments, the processor uses the default transaction type they have on file for you instead of the default value (listed in Appendix I, \"Commerce Indicators,\" on page 441.)  #### Payer Authentication Transactions For the possible values and requirements, see \"Payer Authentication,\" page 195.  #### Card Present You must set this field to `retail`. This field is required for a card-present transaction. Note that this should ONLY be used when the cardholder and card are present at the time of the transaction. For all keyed transactions originated from a POS terminal where the cardholder and card are not present, commerceIndicator should be submitted as “moto\" 
    attr_accessor :commerce_indicator

    # Type of digital payment solution for the transaction. Possible Values:   - `visacheckout`: Visa Checkout. This value is required for Visa Checkout transactions. For details, see `payment_solution` field description in [Visa Checkout Using the SCMP API.](https://apps.cybersource.com/library/documentation/dev_guides/VCO_SCMP_API/html/)  - `001`: Apple Pay.  - `004`: Cybersource In-App Solution.  - `005`: Masterpass. This value is required for Masterpass transactions on OmniPay Direct. For details, see \"Masterpass\" in the [Credit Card Services Using the SCMP API Guide.](https://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html/)  - `006`: Android Pay.  - `007`: Chase Pay.  - `008`: Samsung Pay.  - `012`: Google Pay.  - `013`: Cybersource P2PE Decryption  - `014`: Mastercard credential on file (COF) payment network token. Returned in authorizations that use a payment network token associated with a TMS token.  - `015`: Visa credential on file (COF) payment network token. Returned in authorizations that use a payment network token associated with a TMS token.  - `027`: Click to Pay. 
    attr_accessor :payment_solution

    # Please check with Cybersource customer support to see if your merchant account is configured correctly so you can include this field in your request. * For Payouts: max length for FDCCompass is String (22). 
    attr_accessor :reconciliation_id

    # Value that links the current authorization request to the original authorization request. Set this value to the ID that was returned in the reply message from the original authorization request.  This value is used for:  - Partial authorizations - Split shipments  For details, see `link_to_request` field description in [Credit Card Services Using the SCMP API.](https://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html/) 
    attr_accessor :link_id

    # Set this field to 3 to indicate that the request includes Level III data.
    attr_accessor :purchase_level

    # Attribute that lets you define custom grouping for your processor reports. This field is supported only for **Worldpay VAP**.  For details, see `report_group` field description in [Credit Card Services Using the SCMP API.](https://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html/) 
    attr_accessor :report_group

    # Identifier for the **Visa Checkout** order. Visa Checkout provides a unique order ID for every transaction in the Visa Checkout **callID** field. 
    attr_accessor :visa_checkout_id

    # Indicates that the transaction includes industry-specific data.  Possible Values: - `airline` - `restaurant` - `lodging` - `auto_rental` - `transit` - `healthcare_medical` - `healthcare_transit` - `transit`  #### Card Present, Airlines and Auto Rental You must set this field to `airline` in order for airline data to be sent to the processor. For example, if this field is not set to `airline` or is not included in the request, no airline data is sent to the processor.  You must set this field to `restaurant` in order for restaurant data to be sent to the processor. When this field is not set to `restaurant` or is not included in the request, no restaurant data is sent to the processor.  You must set this field to `auto_rental` in order for auto rental data to be sent to the processor. For example, if this field is not set to `auto_rental` or is not included in the request, no auto rental data is sent to the processor.  Restaurant data is supported only on CyberSource through VisaNet. 
    attr_accessor :industry_data_type

    attr_accessor :authorization_options

    attr_accessor :capture_options

    attr_accessor :recurring_options

    attr_accessor :bank_transfer_options

    attr_accessor :purchase_options

    attr_accessor :electronic_benefits_transfer

    attr_accessor :loan_options

    # This field carries the wallet type in authorization requests and credit requests. Possible value are: - `101`: Masterpass remote payment. The customer created the wallet by manually interacting with a customer-controlled device such as a computer, tablet, or phone. This value is supported only for Masterpass transactions on Chase Paymentech Solutions and CyberSource through VisaNet. - `102`: Masterpass remote near field communication (NFC) payment. The customer created the wallet by tapping a PayPass card or customer-controlled device at a contactless card reader. This value is supported only for card-present Masterpass transactions on CyberSource through VisaNet. - `103`: Masterpass Apple Pay payment. The payment was made with a combination of Masterpass and Apple Pay. This value is supported only for Masterpass Apple Pay transactions on CyberSource through VisaNet. - `216`: Masterpass Google Pay payment. The payment was made with a combination of Masterpass and Google Pay. This value is supported only for Masterpass Google Pay transactions on CyberSource through VisaNet. - `217`: Masterpass Samsung Pay payment. The payment was made with a combination of Masterpass and Samsung Pay. This value is supported only for Masterpass Samsung Pay transactions on CyberSource through VisaNet. - `SDW`: Staged digital wallet. An issuer or operator created the wallet. This value is supported only for Masterpass transactions on Chase Paymentech Solutions. - `VCIND`: Visa Checkout payment. This value is supported only on CyberSource through VisaNet, FDC Compass, FDC Nashville Global, FDI Australia, and TSYS Acquiring Solutions. See Getting Started with Visa Checkout. For Visa Checkout transactions, the way CyberSource processes the value for this field depends on the processor. See the Visa Checkout section below. For all other values, this field is a passthrough; therefore, CyberSource does not verify the value or modify it in any way before sending it to the processor. Masterpass (101, 102, 103, 216, and 217): The Masterpass platform generates the wallet type value and passes it to you along with the customer’s checkout information.  Visa Checkout: This field is optional for Visa Checkout authorizations on FDI Australia. For all other processors, this field is required for Visa Checkout authorizations. For Visa Checkout transactions on the following processors, CyberSource sends the value that the processor expects for this field:FDC Compass,FDC Nashville Global,FDI Australia,TSYS Acquiring Solutions For all other processors, this field is a passthrough; therefore, CyberSource does not verify the value or modify it in any way before sending it to the processor. For incremental authorizations, this field is supported only for Mastercard and the supported values are 101 and 102. Payment card companies can introduce new values without notice. Your order management system should be able to process new values without problems.  CyberSource through VisaNet When the value for this field is 101, 102, 103, 216, or 217, it corresponds to the following data in the TC 33 capture file5: Record: CP01 TCR6, Position: 88-90,  Field: Mastercard Wallet Identifier. When the value for this field is VCIND, it corresponds to the following data in the TC 33 capture file5: Record: CP01 TCR8, Position: 72-76, Field: Agent Unique ID. 
    attr_accessor :wallet_type

    # Supplementary domestic transaction information provided by the acquirer for National Net Settlement Service (NNSS) transactions. NNSS is a settlement service that Visa provides. For transactions on CyberSource through VisaNet in countries that subscribe to NNSS: VisaNet clears transactions; VisaNet transfers funds to the acquirer after deducting processing fees and interchange fees. VisaNet settles transactions in the local pricing currency through a local financial institution. This field is supported only on CyberSource through VisaNet for domestic data in Colombia 
    attr_accessor :national_net_domestic_data

    attr_accessor :japan_payment_options

    # Type of payment initiated from a cardholder's mobile device. Possible values: - `1` :  Consumer-initiated remote purchase, face-to-face - `2` :  Consumer-initiated remote purchase, e-commerce - `3` :  Consumer-initiated remote purchase, mail order / telephone order - `4` :  Consumer-initiated bill pay - `5` :  Consumer-initiated top up - `6` :  Consumer-initiated cash out - `7` :  ATM triggered or agent-initiated cash out - `8` :  Merchant-initiated remote purchase, face-to-face - `9` :  Merchant-initiated remote purchase, e-commerce  This field is supported only for Mastercard transactions on CyberSource through VisaNet.  Optional field.  **Note** On CyberSource through VisaNet, the value for this field corresponds to the following data in the TC 33 capture file: - Record: CP01 TCR6 - Position: 94 - Field: Mastercard Mobile Remote Payment Program Indicator  The TC 33 Capture file contains information about the purchases and refunds that a merchant submits to CyberSource. CyberSource through VisaNet creates the TC 33 Capture file at the end of the day and sends it to the merchant’s acquirer, who uses this information to facilitate end-of-day clearing processing with payment networks. 
    attr_accessor :mobile_remote_payment_type

    # A private national-use field submitted by acquirers and issuers in South Africa for South Africa-domestic (intra-country) authorizations and financial requests. Values for this field are 00 through 99. 
    attr_accessor :extended_credit_total_count

    # On PIN Debit Gateways: This U.S.-only field is optionally used by  participants (merchants and acquirers) to specify the network access priority. VisaNet checks to determine if there are issuer routing preferences for any of the networks specified by the sharing group code. If an issuer preference exists for one of the specified debit networks, VisaNet makes a routing selection based on the issuer’s preference. If an issuer preference exists for more than one of the specified debit networks, or if no issuer preference exists, VisaNet makes a selection based on the acquirer’s routing priorities.  #### PIN debit Priority order of the networks through which he transaction will be routed. Set this value to a series of one-character network codes in your preferred order. This is a list of the network codes:  | Network | Code | | --- | --- | | Accel | E | | AFFN | U | | Alaska Option | 3 | | CU24 | C | | Interlink | G | | Maestro | 8 | | NETS | P | | NYCE | F | | Pulse | H | | Shazam | 7 | | Star | M | | Visa | V |  For example, if the Star network is your first preference and Pulse is your second preference, set this field to a value of `MH`.  When you do not include this value in your PIN debit request, the list of network codes from your account is used. **Note** This field is supported only for businesses located in the U.S.  Optional field for PIN debit credit or PIN debit purchase. 
    attr_accessor :network_routing_order

    # Flag that indicates if the transaction is pay by points transaction true: Transaction uses loyalty points false: Transaction does not use loyalty points Default: false 
    attr_accessor :pay_by_points_indicator

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'action_list' => :'actionList',
        :'action_token_types' => :'actionTokenTypes',
        :'capture' => :'capture',
        :'processor_id' => :'processorId',
        :'business_application_id' => :'businessApplicationId',
        :'commerce_indicator' => :'commerceIndicator',
        :'payment_solution' => :'paymentSolution',
        :'reconciliation_id' => :'reconciliationId',
        :'link_id' => :'linkId',
        :'purchase_level' => :'purchaseLevel',
        :'report_group' => :'reportGroup',
        :'visa_checkout_id' => :'visaCheckoutId',
        :'industry_data_type' => :'industryDataType',
        :'authorization_options' => :'authorizationOptions',
        :'capture_options' => :'captureOptions',
        :'recurring_options' => :'recurringOptions',
        :'bank_transfer_options' => :'bankTransferOptions',
        :'purchase_options' => :'purchaseOptions',
        :'electronic_benefits_transfer' => :'electronicBenefitsTransfer',
        :'loan_options' => :'loanOptions',
        :'wallet_type' => :'walletType',
        :'national_net_domestic_data' => :'nationalNetDomesticData',
        :'japan_payment_options' => :'japanPaymentOptions',
        :'mobile_remote_payment_type' => :'mobileRemotePaymentType',
        :'extended_credit_total_count' => :'extendedCreditTotalCount',
        :'network_routing_order' => :'networkRoutingOrder',
        :'pay_by_points_indicator' => :'payByPointsIndicator'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'action_list' => :'Array<String>',
        :'action_token_types' => :'Array<String>',
        :'capture' => :'BOOLEAN',
        :'processor_id' => :'String',
        :'business_application_id' => :'String',
        :'commerce_indicator' => :'String',
        :'payment_solution' => :'String',
        :'reconciliation_id' => :'String',
        :'link_id' => :'String',
        :'purchase_level' => :'String',
        :'report_group' => :'String',
        :'visa_checkout_id' => :'String',
        :'industry_data_type' => :'String',
        :'authorization_options' => :'Ptsv2paymentsProcessingInformationAuthorizationOptions',
        :'capture_options' => :'Ptsv2paymentsProcessingInformationCaptureOptions',
        :'recurring_options' => :'Ptsv2paymentsProcessingInformationRecurringOptions',
        :'bank_transfer_options' => :'Ptsv2paymentsProcessingInformationBankTransferOptions',
        :'purchase_options' => :'Ptsv2paymentsProcessingInformationPurchaseOptions',
        :'electronic_benefits_transfer' => :'Ptsv2paymentsProcessingInformationElectronicBenefitsTransfer',
        :'loan_options' => :'Ptsv2paymentsProcessingInformationLoanOptions',
        :'wallet_type' => :'String',
        :'national_net_domestic_data' => :'String',
        :'japan_payment_options' => :'Ptsv2paymentsProcessingInformationJapanPaymentOptions',
        :'mobile_remote_payment_type' => :'String',
        :'extended_credit_total_count' => :'String',
        :'network_routing_order' => :'String',
        :'pay_by_points_indicator' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'actionList')
        if (value = attributes[:'actionList']).is_a?(Array)
          self.action_list = value
        end
      end

      if attributes.has_key?(:'actionTokenTypes')
        if (value = attributes[:'actionTokenTypes']).is_a?(Array)
          self.action_token_types = value
        end
      end

      if attributes.has_key?(:'capture')
        self.capture = attributes[:'capture']
      else
        self.capture = false
      end

      if attributes.has_key?(:'processorId')
        self.processor_id = attributes[:'processorId']
      end

      if attributes.has_key?(:'businessApplicationId')
        self.business_application_id = attributes[:'businessApplicationId']
      end

      if attributes.has_key?(:'commerceIndicator')
        self.commerce_indicator = attributes[:'commerceIndicator']
      end

      if attributes.has_key?(:'paymentSolution')
        self.payment_solution = attributes[:'paymentSolution']
      end

      if attributes.has_key?(:'reconciliationId')
        self.reconciliation_id = attributes[:'reconciliationId']
      end

      if attributes.has_key?(:'linkId')
        self.link_id = attributes[:'linkId']
      end

      if attributes.has_key?(:'purchaseLevel')
        self.purchase_level = attributes[:'purchaseLevel']
      end

      if attributes.has_key?(:'reportGroup')
        self.report_group = attributes[:'reportGroup']
      end

      if attributes.has_key?(:'visaCheckoutId')
        self.visa_checkout_id = attributes[:'visaCheckoutId']
      end

      if attributes.has_key?(:'industryDataType')
        self.industry_data_type = attributes[:'industryDataType']
      end

      if attributes.has_key?(:'authorizationOptions')
        self.authorization_options = attributes[:'authorizationOptions']
      end

      if attributes.has_key?(:'captureOptions')
        self.capture_options = attributes[:'captureOptions']
      end

      if attributes.has_key?(:'recurringOptions')
        self.recurring_options = attributes[:'recurringOptions']
      end

      if attributes.has_key?(:'bankTransferOptions')
        self.bank_transfer_options = attributes[:'bankTransferOptions']
      end

      if attributes.has_key?(:'purchaseOptions')
        self.purchase_options = attributes[:'purchaseOptions']
      end

      if attributes.has_key?(:'electronicBenefitsTransfer')
        self.electronic_benefits_transfer = attributes[:'electronicBenefitsTransfer']
      end

      if attributes.has_key?(:'loanOptions')
        self.loan_options = attributes[:'loanOptions']
      end

      if attributes.has_key?(:'walletType')
        self.wallet_type = attributes[:'walletType']
      end

      if attributes.has_key?(:'nationalNetDomesticData')
        self.national_net_domestic_data = attributes[:'nationalNetDomesticData']
      end

      if attributes.has_key?(:'japanPaymentOptions')
        self.japan_payment_options = attributes[:'japanPaymentOptions']
      end

      if attributes.has_key?(:'mobileRemotePaymentType')
        self.mobile_remote_payment_type = attributes[:'mobileRemotePaymentType']
      end

      if attributes.has_key?(:'extendedCreditTotalCount')
        self.extended_credit_total_count = attributes[:'extendedCreditTotalCount']
      end

      if attributes.has_key?(:'networkRoutingOrder')
        self.network_routing_order = attributes[:'networkRoutingOrder']
      end

      if attributes.has_key?(:'payByPointsIndicator')
        self.pay_by_points_indicator = attributes[:'payByPointsIndicator']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] processor_id Value to be assigned
    def processor_id=(processor_id)
      @processor_id = processor_id
    end

    # Custom attribute writer method with validation
    # @param [Object] commerce_indicator Value to be assigned
    def commerce_indicator=(commerce_indicator)
      @commerce_indicator = commerce_indicator
    end

    # Custom attribute writer method with validation
    # @param [Object] payment_solution Value to be assigned
    def payment_solution=(payment_solution)
      @payment_solution = payment_solution
    end

    # Custom attribute writer method with validation
    # @param [Object] reconciliation_id Value to be assigned
    def reconciliation_id=(reconciliation_id)
      @reconciliation_id = reconciliation_id
    end

    # Custom attribute writer method with validation
    # @param [Object] link_id Value to be assigned
    def link_id=(link_id)
      @link_id = link_id
    end

    # Custom attribute writer method with validation
    # @param [Object] purchase_level Value to be assigned
    def purchase_level=(purchase_level)
      @purchase_level = purchase_level
    end

    # Custom attribute writer method with validation
    # @param [Object] report_group Value to be assigned
    def report_group=(report_group)
      @report_group = report_group
    end

    # Custom attribute writer method with validation
    # @param [Object] visa_checkout_id Value to be assigned
    def visa_checkout_id=(visa_checkout_id)
      @visa_checkout_id = visa_checkout_id
    end

    # Custom attribute writer method with validation
    # @param [Object] industry_data_type Value to be assigned
    def industry_data_type=(industry_data_type)
      @industry_data_type = industry_data_type
    end

    # Custom attribute writer method with validation
    # @param [Object] wallet_type Value to be assigned
    def wallet_type=(wallet_type)
      @wallet_type = wallet_type
    end

    # Custom attribute writer method with validation
    # @param [Object] national_net_domestic_data Value to be assigned
    def national_net_domestic_data=(national_net_domestic_data)
      @national_net_domestic_data = national_net_domestic_data
    end

    # Custom attribute writer method with validation
    # @param [Object] mobile_remote_payment_type Value to be assigned
    def mobile_remote_payment_type=(mobile_remote_payment_type)
      @mobile_remote_payment_type = mobile_remote_payment_type
    end

    # Custom attribute writer method with validation
    # @param [Object] extended_credit_total_count Value to be assigned
    def extended_credit_total_count=(extended_credit_total_count)
      @extended_credit_total_count = extended_credit_total_count
    end

    # Custom attribute writer method with validation
    # @param [Object] network_routing_order Value to be assigned
    def network_routing_order=(network_routing_order)
      @network_routing_order = network_routing_order
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          action_list == o.action_list &&
          action_token_types == o.action_token_types &&
          capture == o.capture &&
          processor_id == o.processor_id &&
          business_application_id == o.business_application_id &&
          commerce_indicator == o.commerce_indicator &&
          payment_solution == o.payment_solution &&
          reconciliation_id == o.reconciliation_id &&
          link_id == o.link_id &&
          purchase_level == o.purchase_level &&
          report_group == o.report_group &&
          visa_checkout_id == o.visa_checkout_id &&
          industry_data_type == o.industry_data_type &&
          authorization_options == o.authorization_options &&
          capture_options == o.capture_options &&
          recurring_options == o.recurring_options &&
          bank_transfer_options == o.bank_transfer_options &&
          purchase_options == o.purchase_options &&
          electronic_benefits_transfer == o.electronic_benefits_transfer &&
          loan_options == o.loan_options &&
          wallet_type == o.wallet_type &&
          national_net_domestic_data == o.national_net_domestic_data &&
          japan_payment_options == o.japan_payment_options &&
          mobile_remote_payment_type == o.mobile_remote_payment_type &&
          extended_credit_total_count == o.extended_credit_total_count &&
          network_routing_order == o.network_routing_order &&
          pay_by_points_indicator == o.pay_by_points_indicator
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [action_list, action_token_types, capture, processor_id, business_application_id, commerce_indicator, payment_solution, reconciliation_id, link_id, purchase_level, report_group, visa_checkout_id, industry_data_type, authorization_options, capture_options, recurring_options, bank_transfer_options, purchase_options, electronic_benefits_transfer, loan_options, wallet_type, national_net_domestic_data, japan_payment_options, mobile_remote_payment_type, extended_credit_total_count, network_routing_order, pay_by_points_indicator].hash
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
