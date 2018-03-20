require "gobject-introspection"

require "cv/version"

require "cv/loader"

module CV
  class Error < StandardError
  end

  Loader.load
end
