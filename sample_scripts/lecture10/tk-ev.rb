#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

def erase(widget)
  widget.value = ""             # Entryの入力文字列を消す
end

TkLabel.new("text" => " Hello, world! ") {
  # ラベルでは、マウス第3ボタンが効き、キーは効かない
  bind('Button-3', proc {exit}) 	# 右ボタンがクリックされたら
  bind('Key-3', proc {exit})    	# キー3が押されたら(でも効かない)
}.pack
TkEntry.new {|tke|
  # 入力窓では、マウス第3ボタン、第2ボタン、キー'q'、'x'が効く
  bind('Key-3', proc {erase(tke)}) 	# キー3が押されたら(これは効く)
  bind('2', proc {erase(tke)})          # 1,2,3とだけ書くとマウスボタン
  bind('Key-q', proc {                  # Key-q でも q でもよい
         erase(tke)
         Tk.callback_break		# q そのものの入力を回避
       })
  bind('x', proc {erase(tke)})          # xならキー 'x'
}.pack
puts "ラベル上のボタン3で終了"
Tk.mainloop
