#!/usr/bin/env ruby

require "cv"
require "gtk3"

app = Gtk::Application.new
app.signal_connect(:activate) do
  window = Gtk::ApplicationWindow.new(app)
  image = Gtk::Image.new
  camera = CV::Camera.new
  GLib::Timeout.add(100) do
    cv_image = camera.read
    cv_image_rgb = cv_image.convert_color(:bgr2rgb)
    image.pixbuf = GdkPixbuf::Pixbuf.new(bytes: cv_image_rgb.bytes,
                                         has_alpha: cv_image_rgb.n_channels == 4,
                                         width: cv_iamge_rgb.n_columns,
                                         height: cv_iamge_rgb.n_rows)
    image.queue_draw
    GLib::Source::CONTINUE
  end
  window.add(image)
  window.show_all
end
app.run
