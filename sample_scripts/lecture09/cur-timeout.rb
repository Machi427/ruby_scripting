#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses
cbreak
Curses.timeout = 2500           # 2.5秒でアウト

srand
alphabet = "abcdefghijklmnopqrstuvwxyz"
ans = alphabet[rand(alphabet.length)]

begin
  init_screen
  setpos(5,10)
  addstr(sprintf("%cを押せ! : ", ans))
  refresh
  key = getch
  setpos(6,10)
  if key == ans
    addstr("正解! また会おう")
  else
    addstr("出直してこい")
  end
  refresh
  sleep 2
ensure
  close_screen
end

# Ruby1.9 Ready
