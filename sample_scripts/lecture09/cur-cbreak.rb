#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

begin
  init_screen			# スクリーンを初期化する
  cbreak			# リターンキーなしでも入力させる
  noecho			# 入力文字のエコーバックを無しにする
  addstr("何かキーを押してください(打った文字は見えません): ")
  x = getch			# 1字読み取る(文字コードが返る)
  addstr("\nさようなら(3秒後に終わります)")
  refresh			# 出力を画面に反映させる
  sleep 3			# 結果がしばらく見えるようにする
ensure
  close_screen
end
