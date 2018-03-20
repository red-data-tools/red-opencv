module CV
  class Image
    class << self
      alias_method :read_raw, :read
      def read(filename, flags=nil)
        flags ||= [:any_depth, :any_color]
        read_raw(filename, flags)
      end
    end
  end
end
