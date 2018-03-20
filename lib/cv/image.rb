module CV
  class Image
    class << self
      alias_method :read_raw, :read
      def read(filename, flags=nil)
        filename = filename.to_path if filename.respond_to?(:to_path)
        flags ||= [:any_depth, :any_color]
        read_raw(filename, flags)
      end
    end
  end
end
