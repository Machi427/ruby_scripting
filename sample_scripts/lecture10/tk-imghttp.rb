#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'
require 'open-uri'
require 'tkextlib/tkimg/png'

img = open("http://www.yatex.org/lect/ruby/star.png", "r") do |s|
  s.read
end

TkLabel.new() {
  image(TkPhotoImage.new("data"=>Tk::BinaryString(img)))
  bg("white")
}.pack
TkButton.new() {
  text("exit")
  command(proc {exit(0)})
}.pack
Tk.mainloop
