class TestDrawingOptions < Test::Unit::TestCase
  include Helper::Fixture

  sub_test_case(".try_convert") do
    def test_hash
      unless CV.const_defined?(:DrawingOptions)
        omit("Require opencv-glib 1.0.2 or later")
      end
      image_with_options = CV::Image.read(fixture_path("mail-forward.png"))
      image_without_options = image_with_options.clone
      image_with_options.draw_rectangle(CV::Rectangle.new(15, 20, 5, 10),
                                        CV::Color.new(255, 127, 0, 2),
                                        thickness: 5,
                                        line_type: :line_aa,
                                        shift: 2)
      image_without_options.draw_rectangle(CV::Rectangle.new(15, 20, 5, 10),
                                           CV::Color.new(255, 127, 0, 2))
      assert_not_equal(image_with_options.bytes.to_s,
                       image_without_options.bytes.to_s)
    end
  end
end
