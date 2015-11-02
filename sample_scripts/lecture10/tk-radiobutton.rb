#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

v = TkVariable.new
TkRadioButton.new {
  text("あじ")
  variable v
  value "鯵"
}.pack("fill"=>'x')
TkRadioButton.new {
  text("いか")
  variable v
  value "烏賊"
}.pack("fill"=>'x')
TkRadioButton.new {
  text("うなぎ")
  variable v
  value "鰻"
}.pack("fill"=>'x')
TkButton.new {
  text("決定")
  command(proc {
            if v.value == "" then     # 何も選んでいないとき
              puts("何か選んでね。")
            else
              printf("%s食べよう!\n", v.value)
              exit 0
            end
          })
}.pack
TkButton.new {
  text("リセット")
  command(proc {v.value = ""})
}.pack
Tk.mainloop
