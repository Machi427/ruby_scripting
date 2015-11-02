#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

init_screen                     # スクリーンを初期化する

begin
  setpos(4, 9)                  # 5行目の10桁目(0から数えるため)
  addstr("こんにちは")
  refresh                       # 出力を画面に反映させる
  sleep 3                       # これがないとすぐ消えてしまうため
ensure
  close_screen
end
