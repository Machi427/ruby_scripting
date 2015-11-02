#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'
require 'tkextlib/tkimg/png' # PNGを利用する場合必要

img = TkPhotoImage.new("file"=>"nikusoba.png")
TkLabel.new("image"=>img, "bg"=>"pink").pack
TkButton.new("text"=>"食べる",
             "command"=>proc{puts "ごちそうさま"; exit(0)}).pack
Tk.mainloop
