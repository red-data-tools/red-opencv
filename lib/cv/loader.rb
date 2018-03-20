module CV
  class Loader < GObjectIntrospection::Loader
    class << self
      def load
        super("CV", CV)
      end
    end
  end
end
