module EnumConstants
  extend ActiveSupport::Concern

  class_methods do
    def define_enum_constants(attribute, prefix: nil)
      constant_prefix = (prefix || attribute).to_s.upcase
      enum_mapping = defined_enums[attribute.to_s]

      raise ArgumentError, "Enum :#{attribute} not defined. Call enum(:#{attribute}, ...) before define_enum_constants(:#{attribute})" unless enum_mapping

      enum_mapping.each do |key, value|
        normalized_key = key.to_s.underscore.upcase
        const_name = "#{constant_prefix}_#{normalized_key}"
        const_set(const_name, value) unless const_defined?(const_name)
      end
    end
  end
end
