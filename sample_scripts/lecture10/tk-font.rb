#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

txv = TkVariable.new('24のフォント')
def enlarge(me)		# meには下のラベルオブジェクトが渡されて来る
  f = me.font
  v = me.textvariable
  f.size = (f.size.to_f*1.2).to_i
  v.value = sprintf("%dのフォント", f.size)
end

f = TkFont.new("ipagothic 24 italic")
TkLabel.new() {
  textvariable txv
  text("24のフォント")
  font(f)
  bind('Button-1', proc {enlarge(self)})
}.pack
Tk.mainloop
