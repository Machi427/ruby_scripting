#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkOption.add("*font", "ipagothic 16")
TkLabel.new() {
  text("ラベルの1番"); bg("green")}.
  grid("row"=>0, "column"=>0, "sticky"=>"news")	# 0行0列
TkLabel.new() {
  text("ラベル2"); bg("pink")}.
  grid("row"=>0, "column"=>1, "sticky"=>"news")	# 0行1列
TkLabel.new() {
  text("ラ\nベ\nル3"); bg("pink")}.
  grid("row"=>1, "column"=>0, "sticky"=>"news")	# 1行0列
TkLabel.new() {					# 1行1列
  text("L 4"); bg("green")
}.grid("row"=>1, "column"=>1, "sticky"=>"nwes")

#TkGrid.columnconfigure(Tk.root, 0, "weight"=>1)
#TkGrid.columnconfigure(Tk.root, 1, "weight"=>2)
Tk.mainloop
