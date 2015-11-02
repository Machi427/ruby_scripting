#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

label = TkLabel.new("text"=>"こんにちは", "bg"=>"yellow").pack("fill"=>"both")
TkFrame.new {|f|
  TkLabel.new(f, "text"=>"ひとこと").pack("side"=>"left")
  TkEntry.new(f, "bg"=>"pink").pack("side"=>"left")
}.pack
TkFrame.new() {|f|
  background "pink"
  TkButton.new(f, "text"=>" 1 ").pack("side"=>"left", "expand"=>true, "fill"=>"both")
  TkButton.new(f, "text"=>" 2 ").pack("side"=>"left", "expand"=>true, "fill"=>"both")
  TkButton.new(f, "text"=>" 3 ").pack("side"=>"left", "expand"=>true, "fill"=>"both")
}.pack("side"=>"top", "fill"=>"both", "expand"=>true)

Tk.mainloop
