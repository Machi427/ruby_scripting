#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkLabel.new() {
  text("Hello, world!")
  bg("#fdd"); fg("black")
  bind("Enter", proc {bg("#dfd")})
  bind("Leave", proc {bg("#fdd")})
  bind("Button-1", proc {exit(0)})
}.pack
Tk.mainloop
