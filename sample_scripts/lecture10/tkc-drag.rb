#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkCanvas.new() {|c|
  width 400
  height 300
  TkcRectangle.new(self, 50, 50, 100, 80) {
    fill("yellow")
    ox, oy = nil, nil           # 以前の座標値
    bind("ButtonPress-1", proc {|x, y|
           ox, oy = x, y        # ボタン押された瞬間の座標を記憶
           c.cursor("fleur")    # 移動カーソルに変更
         }, "%x %y")            # %x %y はウィンドウ内の相対座標
    bind('Motion', proc {|x, y|
           next unless ox
           move(x-ox, y-oy)     # 前回からの差分だけ移動
           ox, oy = x, y
         }, "%x %y")
    bind('ButtonRelease-1', proc {
           c.cursor("")         # カーソルを戻す
           ox, oy = nil, nil}
         )
  }
}.pack
Tk.mainloop
