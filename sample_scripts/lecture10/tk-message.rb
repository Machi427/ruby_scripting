#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkMessage.new() {
  aspect(400)
  text("これはアスペクト比400%に指定したメッセージエリアである。
ソース中の改行はそのまま改行として反映されるが、
必ずしも改行させたくない\
位置にはバックスラッシュを入れる。")
  bg("pink")
}.pack
TkMessage.new() {
  width(200)
  text("これは幅200ピクセルに指定したメッセージエリアである。")
  bg("yellow")
}.pack
TkMessage.new() {
  width("10c")
  text("これは幅10cmに指定したメッセージエリアである。")
  bg("#aef")
}.pack

Tk.mainloop
