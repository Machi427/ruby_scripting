#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkLabel.new("text"=>"今日の一言").pack
txt = TkText.new("width"=>40, "height"=>3).pack
TkButton.new("text"=>"登録") {
  command(proc {
            printf("復唱: %s\n", txt.value) if txt.value > ""
            exit(0)
          })
}.pack("side"=>"left", "padx"=>5, "pady"=>5)
Tk.mainloop
