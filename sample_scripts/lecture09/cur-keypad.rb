#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

begin
  init_screen
  x = cols/2
  y = lines-2
  noecho
  stdscr.keypad=true            # ここをコメントアウトしてみよ
  setpos(y, x)                  # 最初の1個を書いておく
  addstr("●")
  setpos(0, 0)
  addstr("←→かhlで左右、F9かcで中央に戻す。F10かqで終了")

  refresh
  while true
    c = getch
    setpos(y, x)
    addstr("  ")                # 以前書いた丸を消す
    case c
    when KEY_LEFT, ?h
      x -= 1
    when KEY_RIGHT, ?l
      x += 1
    when KEY_F9, ?c
      x = cols/2
    when ?q, KEY_F10, ?\n
      break
    else
      setpos(1, 0)
      addstr(sprintf("不明なキー: %s", c.inspect))
    end
    x = 1 if x < 1
    x = cols-2 if x > cols-2
    setpos(y, x)
    addstr("●")
    setpos(1, 0)                # 邪魔なのでカーソルをどかす
    refresh
  end
ensure
  close_screen
end
