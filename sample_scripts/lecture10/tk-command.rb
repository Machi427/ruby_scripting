#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkButton.new("text"=>"Button") {
  command(proc {puts "これはボタン"})
}.pack
TkCheckbutton.new("text"=>"Check Button") {
  command(proc {puts "これはチェックボタン"})
}.pack
TkFrame.new {|f|
  v = TkVariable.new
  TkRadiobutton.new(f, "text"=>"Radio Button") {
    command(proc {puts "ラジオボタン-1"})
    variable(v)
    value("1")
  }.pack("side"=>"left")
  TkRadiobutton.new(f, "text"=>"Radio Button") {
    command(proc {puts "ラジオボタン-2"})
    variable(v)
    value("2")
  }.pack("side"=>"left")
}.pack

Tk.mainloop
