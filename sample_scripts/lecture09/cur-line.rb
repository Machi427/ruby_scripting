#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
# Ruby1.9 Ready
require 'curses'
include Curses

begin
  init_screen
  y = lines/3
  cbreak
  noecho
  setpos(y, 0)
  addstr("キーを押すと終了")
  refresh

  Thread.new do
    getch                       # キー入力があったら
    exit                        # exitするだけのスレッド
  end
  while true
    0.upto(9) do |i|
      setpos(y, 0)
      insertln                  # 1行挿入してから
      addstr("行番号 #{i}")     # 文字列出力
      sleep 0.2
      refresh
    end
    setpos(y, 0)
    0.upto(9) do |i|
      deleteln                  # y行目を1行削除
      refresh
      sleep 0.2
    end
  end
ensure
  close_screen
end
