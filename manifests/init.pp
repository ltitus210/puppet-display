# == Class: display
#
# Installs and configures Xvfb and x11vnc.
#
# === Parameters
#
# [*display*]
#    X display to use. Default is 0.
# [*width*]
#    Screen width to use. Default is 1280.
# [*height*]
#    Screen height to use. Default is 800.
# [*color*]
#    Screen color depth to use. Default is "24+32" (32 bit).
#
# === Examples
#
#  class {'display':
#    display => 99,
#    width   => 1024,
#    height  => 768,
#    color   => 24,
#  }
#
# === Authors
#
# Larry Titus <ltitus210@me.com>
#
# === Copyright
#
# Copyright 2017 Larry Titus.
#
class display(
  $display = 0,
  $width   = 1280,
  $height  = 768,
  $color   = '24+32'
) inherits display::params {
  contain display::env
  contain display::x11vnc
  contain display::xvfb

  Class['::display::xvfb'] -> Class['::display::x11vnc'] -> Class['::display::env']
}
