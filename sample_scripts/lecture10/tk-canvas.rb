#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

w = 400
c = TkCanvas.new("width"=>w, "height"=>w).pack		# 正方形のCanvas
TkButton.new("text"=>'quit', 'command'=>'exit').pack	# 終了ボタン
r = 100                         			# 円の初期半径=100
width = c.width
cx, cy = c.width/2, c.height/2
# 円は，外接する四角形の対角頂点座標を4値で指定して生成する
ovl = TkcOval.new(c, cx-r, cx-r, cx+r, cy+r,
                  'fill'=>'yellow', 'outline'=>'black')

Thread.new {			# Tk.mainloopをメインスレッドで走らすため
  while true			# この無限ループは別スレッドで動かす
    r = (r+8)%(width/2)		# rを8ずつ増やして枠を超えたら戻るように
    # あとで(楕)円のパラメータを変更できる
    ovl.coords(cx-r, cx-r, cx+r, cy+r)
    sleep 0.1
  end
}
Tk.mainloop
