#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkLabel.new("text" => " Hello, world! ") {
  bind('1', proc {exit})
}.pack
Tk.mainloop
