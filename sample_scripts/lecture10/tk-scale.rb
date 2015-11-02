#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

v = TkVariable.new
TkScale.new() {
  variable v
  from	1
  to	12
  set	Time.now.month
  # showvalue false
  label "開始月"
  orient "horizontal"	# or "vertical"
  command(proc {STDERR.printf("\r%d", v)})
}.pack
# 同じtk変数で連動するウィジェットを作れる
TkEntry.new("textvariable"=>v).pack
TkButton.new("text"=>"Set") {
  command(proc {printf("\n%s", `cal #{v} #{Time.now.year}`); exit(0)})
}.pack
Tk.mainloop
