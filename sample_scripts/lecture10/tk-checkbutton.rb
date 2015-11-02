#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

v = TkVariable.new
TkCheckButton.new {
  text("抜ける")
  width("10")
  height("5")
  variable v
  deselect
}.pack
TkButton.new() {
  text(" GO! ")
  command(proc {
            if v == "1"
              puts "抜けます。"; exit 0
            else
              puts "まだまだ"
            end
          })
}.pack
Tk.mainloop
