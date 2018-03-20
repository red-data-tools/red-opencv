# README

## Name

Red OpenCV

## Description

Red OpenCV is a Ruby bindings of OpenCV. Red OpenCV is based on GObject Introspection.

[OpenCV][opencv] is a computer vision library.

[GObject Introspection][gobject-introspection] is a middleware for language bindings of C library. GObject Introspection can generate language bindings automatically at runtime.

Red OpenCV uses [OpenCV GLib][opencv-glib] and [gobject-introspection gem][gobject-introspection-gem] to generate Ruby bindings of OpenCV.

OpenCV GLib is a C wrapper for OpenCV. GObject Introspection can't use OpenCV directly because OpenCV uses C++. OpenCV GLib is a bridge between OpenCV and GObject Introspection.

gobject-introspection gem is a Ruby bindings of GObject Introspection. Red OpenCV uses GObject Introspection via gobject-introspection gem.

## Install

Install OpenCV GLib before install Red OpenCV. Use [packages.red-data-tools.org][packages-red-data-tools-org] for installing OopenCV GLib.

Install Red OpenCV after you install OpenCV GLib:

```text
% gem install red-opencv
```

## Usage

```ruby
require "cv"

# TODO
```

## Dependencies

  * [OpenCV][opencv]

  * [OpenCV GLib][opencv-glib]


## Authors

  * Kouhei Sutou \<kou@clear-code.com\>

## License

[The 3-Clause BSD license][bsd-3-clause]. See LICENSE for details.

(Kouhei Sutou has a right to change the license including contributed
patches.)

[opencv]:https://opencv.org/

[gobject-introspection]:https://wiki.gnome.org/action/show/Projects/GObjectIntrospection

[opencv-glib]:https://github.com/red-data-tools/opencv-glib

[gobject-introspection-gem]:https://rubygems.org/gems/gobject-introspection

[packages-red-data-tools-org]:https://github.com/red-data-tools/packages.red-data-tools.org

[bsd-3-clause]:https://opensource.org/licenses/BSD-3-Clause
