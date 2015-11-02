#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

begin
  init_screen
  w = stdscr.subwin(5, 36, 10, 5)	# サブウィンドウを作成し w に格納
  w.box("|"[0], "-"[0])                 # サブウィンドウに枠付け
  w.setpos(2, 10)			# サブウィンドウ内の位置指定
  w.addstr("キーを押すと終了")          # サブウィンドウに表示
  w.refresh
  w.getch
ensure
  close_screen
end
