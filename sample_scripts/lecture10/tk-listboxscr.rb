#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkListbox.new() {
  yscrollbar(TkScrollbar.new.pack("fill"=>"y", "side"=>"right"))
  0.upto(100) do |i| insert("end", i.to_s+"番のアイテム") end
}.pack("side"=>"right")
TkButton.new("text"=>"quit", "command"=>"exit").pack
Tk.mainloop
