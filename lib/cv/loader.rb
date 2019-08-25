module CV
  class Loader < GObjectIntrospection::Loader
    class << self
      def load
        super("CV", CV)
      end
    end

    private
    def post_load(repository, namespace)
      require "cv/drawing-options" if CV.const_defined?(:DrawingOptions)
      require "cv/image"
    end
  end
end
