module Helper
  module Fixture
    def fixture_path(*components)
      Pathname.new(__dir__).join("..", "fixture").join(*components)
    end
  end
end
