#!/usr/bin/env ruby

require "cv"
require "gtk3"

app = Gtk::Application.new
app.signal_connect(:activate) do
  window = Gtk::ApplicationWindow.new(app)
  image = Gtk::Image.new
  window.add(image)

  camera = CV::Camera.new
  classifier = CV::CascadeClassifier.new("frontalface_default")
  color = CV::Color.new(0, 0, 255)
  update_id = GLib::Timeout.add(100) do
    cv_image = camera.read
    cv_image_gray = cv_image.convert_color(:bgr2gray)
    objects = classifier.detect(cv_image_gray)
    objects.each do |object|
      cv_image.draw_rectangle(object, color)
    end
    cv_image_rgb = cv_image.convert_color(:bgr2rgb)
    image.pixbuf = GdkPixbuf::Pixbuf.new(bytes: cv_image_rgb.bytes,
                                         width: cv_image_rgb.n_columns,
                                         height: cv_image_rgb.n_rows)
    image.queue_draw
    GLib::Source::CONTINUE
  end
  window.signal_connect(:destroy) do
    GLib::Source.remove(update_id)
  end

  window.show_all
end
app.run
