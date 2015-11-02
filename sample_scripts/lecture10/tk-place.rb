#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkOption.add("*font", "ipagothic 20")
Tk.root.width = 200
Tk.root.height= 80
TkLabel.new("text"=>"その1", "bg"=>"pink").place("x"=>10, "y"=>10)
TkLabel.new("text"=>"その2", "bg"=>"yellow").place("x"=>50, "y"=>30)
Tk.mainloop
