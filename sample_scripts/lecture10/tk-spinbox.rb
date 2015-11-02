#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

v = TkVariable.new
TkSpinbox.new() {
  textvariable v		# tk変数を利用するならtextvariableで
  to	12			# toを先に指定する必要がある。
  from	1
  font	"times 18"
  # values [1,3,5,7,8,10,12]	# 有効な値を配列で与えることも可
  set	Time.now.month
  width	4			# 入力窓の幅
  bg	"khaki"
  command(proc {STDERR.printf("\r%d", v)})
}.pack
TkButton.new("text"=>"Set") {
  command(proc {printf("\n%s", `cal #{v} #{Time.now.year}`); exit(0)})
}.pack
Tk.mainloop
