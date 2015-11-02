#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkCanvas.new {
  width(400)
  height(300)
  bind('1', proc {|x, y, a, b|
         printf("絶対:(%d,%d)\t", x, y)
         printf("相対:(%d,%d)\n", a, b)
       }, "%X %Y %x %y")
}.pack
TkButton.new() {
  text("quit")
  command(proc{exit(0)})
}.pack("side"=>"right")

Tk.mainloop
