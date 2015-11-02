#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

img = TkPhotoImage.new("file"=>"cool.gif")
TkLabel.new("image"=>img).pack
TkButton.new("text"=>"quit", "command"=>proc{exit(0)}).pack
Tk.mainloop
