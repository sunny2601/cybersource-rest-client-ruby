=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Ptsv2paymentsTravelInformationLodgingRoom
    # Daily cost of the room. 
    attr_accessor :daily_rate

    # Number of nights billed at the rate specified by `travelInformation.lodging.room[].dailyRate`. 
    attr_accessor :number_of_nights

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'daily_rate' => :'dailyRate',
        :'number_of_nights' => :'numberOfNights'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'daily_rate' => :'String',
        :'number_of_nights' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'dailyRate')
        self.daily_rate = attributes[:'dailyRate']
      end

      if attributes.has_key?(:'numberOfNights')
        self.number_of_nights = attributes[:'numberOfNights']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@daily_rate.nil? && @daily_rate.to_s.length > 8
        invalid_properties.push('invalid value for "daily_rate", the character length must be smaller than or equal to 8.')
      end

      if !@number_of_nights.nil? && @number_of_nights > 9999
        invalid_properties.push('invalid value for "number_of_nights", must be smaller than or equal to 9999.')
      end

      if !@number_of_nights.nil? && @number_of_nights < 1
        invalid_properties.push('invalid value for "number_of_nights", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@daily_rate.nil? && @daily_rate.to_s.length > 8
      return false if !@number_of_nights.nil? && @number_of_nights > 9999
      return false if !@number_of_nights.nil? && @number_of_nights < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] daily_rate Value to be assigned
    def daily_rate=(daily_rate)
      if !daily_rate.nil? && daily_rate.to_s.length > 8
        fail ArgumentError, 'invalid value for "daily_rate", the character length must be smaller than or equal to 8.'
      end

      @daily_rate = daily_rate
    end

    # Custom attribute writer method with validation
    # @param [Object] number_of_nights Value to be assigned
    def number_of_nights=(number_of_nights)
      if !number_of_nights.nil? && number_of_nights > 9999
        fail ArgumentError, 'invalid value for "number_of_nights", must be smaller than or equal to 9999.'
      end

      if !number_of_nights.nil? && number_of_nights < 1
        fail ArgumentError, 'invalid value for "number_of_nights", must be greater than or equal to 1.'
      end

      @number_of_nights = number_of_nights
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          daily_rate == o.daily_rate &&
          number_of_nights == o.number_of_nights
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [daily_rate, number_of_nights].hash
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