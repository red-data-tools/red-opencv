module CV
  class DrawingOptions
    class << self
      def try_convert(value)
        case value
        when Hash
          options = new
          value.each do |option_name, option_value|
            options.__send__("#{option_name}=", option_value)
          end
          options
        else
          nil
        end
      end
    end
  end
end
