#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

=begin
+-------------------------+       +------------+
|住所      [            ] |       | j1   j2    |
|おなまえ  [       ]      |   =>  | n1   n2    |
|                         |       |            |
| [登録]         [クリア] |       | b1     b2  |
+-------------------------+       +------------+
=end

TkFrame.new {|f|
  # bg("yellow")	# レイアウトデバッグ時には背景色が有用
  j1 = TkLabel.new(f, "text"=>"住所")
  j2 = TkEntry.new(f, "width"=>20)
  n1 = TkLabel.new(f, "text"=>"おなまえ")
  n2 = TkEntry.new(f, "width"=>12)
  j1.grid("row"=>0, "column"=>0, "sticky"=>"w")
  j2.grid("row"=>0, "column"=>1, "sticky"=>"w")
  n1.grid("row"=>1, "column"=>0, "sticky"=>"w")
  n2.grid("row"=>1, "column"=>1, "sticky"=>"w")
  TkGrid.columnconfigure(f, 0, "weight"=>4) # 項目名の列
  TkGrid.columnconfigure(f, 1, "weight"=>1) # Entryの列
}.pack("fill"=>"x", "expand"=>true, "padx"=>10)
TkLabel.new("text"=>"").pack   # spacer
b1 = TkButton.new("text"=>"登録")	# 押しても何も起こらない
b2 = TkButton.new("text"=>"クリア")	# 押しても何も起こらない
b1.pack("side"=>"left", "padx"=>10, "pady"=>5)
b2.pack("side"=>"right", "padx"=>10, "pady"=>5)
Tk.mainloop
