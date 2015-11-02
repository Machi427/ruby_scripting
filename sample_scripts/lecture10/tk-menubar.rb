#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

menuspec=
  [[["F ファイル", 0],
    ["O 開く", proc {puts "open"}, 0],
    ["C 閉じる", proc {puts "close"}, 0],
    ["--"],
    ["Q 終了", "exit", 0]],
   [["E 編集", 0],
    ["C コピー", proc {puts "copy"}, 0],
    ["X カット", proc {puts "cut"}, 0],
    ["V ペースト", proc {puts "paste"}, 0]]]

TkFrame.new {|f|
  # メニューをウィンドウ最上部に左づめにするため
  # pack("side"=>"top", "fill"=>"x") のフレームに left で貼り付ける
  pack("fill"=>"x")
  TkMenubar.new(f, menuspec).pack("side"=>"left")
}
TkScrollbar.new {|s|
  pack("side"=>"right", "fill"=>"y")
  TkText.new("width"=>40, "height"=>10, "bg"=>"#f8f0f0") {
    yscrollbar(s)
  }.pack("side"=>"right")
}
Tk.mainloop
