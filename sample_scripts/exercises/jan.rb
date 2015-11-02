#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

stage = 0
wait = 2000			# /1000s
wingame = false

def shobu(win, limit)
  hands = %w,グー チョキ パー,
  win.timeout = limit
  3.times do |i|
    win.clear
    win.setpos(1, 2)
    win.addstr("じゃんけん(#{i+1}/3): ")
    win.refresh
    sleep 1
    pc = rand(3)
    hand = hands[pc]
    win.addstr(hand)
    win.refresh
    case win.getch              # グー=0, チョキ=1, パー=2 に変換する
    when KEY_LEFT, "g"[0]
      user = 0
    when KEY_UP, "c"[0]
      user = 1
    when KEY_RIGHT, "p"[0]
      user = 2
    else
      return false              # タイムアウトや他のキーは即「負け」
    end
    win.addstr(" : "+hands[user])
    win.refresh
    sleep 0.5
    if (3+pc-user)%3 != 1	# 差のmod3が1ならユーザの勝ち
      return false              # 一度でも勝ちでなかったらfalseを返して負け
    end
  end
  return true
end

begin
  init_screen
  cbreak
  noecho
  cy, cx = lines/2-3, cols/2-20
  center = stdscr.subwin(5, 40, cy, cx)
  center.box("|"[0], "-"[0])
  center.refresh
  field = center.subwin(3, 36, cy+1, cx+1)
  field.keypad(true)            # 矢印キーを使いたいので
  while (stage+=1) <= 3
    center.setpos(0, 4)
    center.addstr(sprintf(" 第%dステージ(%3.1f秒)", stage, wait/1000))
    center.refresh
    (wingame=shobu(field, wait)) or break
    wait /= 2
  end
  field.clear
  if wingame then
    field.addstr("\n おめでとう!!")
  else
    field.addstr("\n ざんねん...さらばじゃ")
  end
  addstr("何かのキーで終了")
  getch
ensure
  close_screen
end
