#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkLabel.new("text"=>"変数xが有効なブロック\nこっちでクリックするとx=5") {
  x = 5
  bind('1', proc {printf("x=%d\n", x)})
  bg("pink")
}.pack("fill"=>"x")
TkLabel.new("text"=>"変数xが有効ではないブロック\nこっちはエラー") {
  bind('1', proc {printf("x=%d\n", x)})
  bg("#aef")
}.pack

TkButton.new("text"=>"Exit", "command"=>proc{exit}).pack
Tk.mainloop
