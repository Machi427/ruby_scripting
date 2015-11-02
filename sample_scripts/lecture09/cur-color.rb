#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

begin
  init_screen
  has_colors? or abort("この端末では色が使えません")
  cbreak
  start_color                     # 必ずinit_screenのあと、init_pairの前
  # init_pair(0, COLOR_BLACK, COLOR_WHITE) # 白のままだね
  init_pair(1, COLOR_RED, COLOR_BLACK)
  init_pair(2, COLOR_GREEN, COLOR_BLACK)
  init_pair(3, COLOR_YELLOW, COLOR_BLACK)
  init_pair(4, COLOR_BLUE, COLOR_BLACK)
  init_pair(5, COLOR_MAGENTA, COLOR_BLACK)
  init_pair(6, COLOR_CYAN, COLOR_BLACK)
  init_pair(7, COLOR_WHITE, COLOR_BLACK)
  init_pair(8, COLOR_BLACK, COLOR_WHITE)
  init_pair(9, COLOR_BLUE, COLOR_YELLOW)
  nc = 9
  init_pair(warn=10, COLOR_RED, COLOR_WHITE)
  # 以上定義した色番号nは color_pair(n) で利用する

  clear
  setpos(0, 0)
  1.upto(nc) do |i|
    addstr("#{i}: ")
    attron(color_pair(i)) do
      addstr("こんにちは ")
      attron(A_BOLD) do
        addstr("太こんにちは ")
      end
      attron(A_REVERSE) do
        addstr("逆こんにちは ")
      end
      attron(A_REVERSE|A_BOLD) do
        addstr("逆太こんにちは ")
      end
    end
    addstr("\n")
  end
  refresh
  addstr("何かキーを押すと終了します.\n")
  refresh
  getch
ensure
  close_screen
end
