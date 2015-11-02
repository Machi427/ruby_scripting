#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

begin
  init_screen			# スクリーンを初期化する
  nocbreak			# Returnでデータをまとめて送る
  addstr("何かキーを押してください: ")
  x = getch			# 1字読み取る(文字コードが返る)
  addstr("\nさようなら(3秒後に終わります)")
  refresh			# 出力を画面に反映させる
  sleep 3			# 結果がしばらく見えるようにする
ensure
  close_screen
end
