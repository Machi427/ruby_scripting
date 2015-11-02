#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
# Ruby1.9 Ready
require 'curses'
include Curses

init_screen
x, y = cols/4, lines/2
cbreak
noecho
setpos(y-3, 0)
addstr("タイプした文字を逆向きに挿入します。\n")
addstr("(Returnで終了、C-h(BS)で後方削除)")
setpos(y, x)
refresh

begin
  while (ch=getch).ord != ?\n.ord
    # .ord は文字コードを得るメソッド。
    # Ruby1.8ではgetchは入力文字の文字コードを返す一方、
    # Ruby1.9ではgetchは長さ1の文字列を返すのだが、
    # 制御文字だけは文字コードで返すため、両方強制的に文字コードに
    # 変換してから比較するようにしないと1.8と1.9で動かない。
    setpos(y-1, x)
    addstr(sprintf("key = %s", ch.inspect))
    setpos(y, x)
    if ch.ord == 0x8.ord        # C-h
      delch
    else
      insch(ch)
    end
    refresh
  end
ensure
  close_screen
end
