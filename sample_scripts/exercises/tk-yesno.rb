#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

message  = ARGV[0] || "よろしいですか"
TkLabel.new("text"=>message  , "bg"=>"yellow") {
  font(TkFont.new("size"=>24))
}.pack("side"=>"top", "expand"=>true, "fill"=>"both")
TkFrame.new() {|f|
  background "pink"
  TkButton.new(f, "text"=>" YES ") {
    command proc {exit 0}
  }.pack("side"=>"left", "fill"=>"both")
  TkButton.new(f, "text"=>" No ") {
    command proc {exit 1}
  }.pack("side"=>"left", "fill"=>"both")
}.pack("side"=>"top")
Tk.mainloop
