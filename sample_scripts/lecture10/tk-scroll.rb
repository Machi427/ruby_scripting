#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

ysb = TkScrollbar.new.pack("fill"=>"y", "side"=>"right")
txt = TkText.new("width"=>40, "height"=>5, "bg"=>"#fee") {
  selectbackground("pink")
  yscrollbar(ysb)
}.pack("side"=>"right")
TkButton.new("text"=>"決定") {
  command(proc {
            printf("[%s]\n", txt.value)
            exit(0)
          })
}.pack("before"=>ysb, "side"=>"top")
Tk.mainloop
