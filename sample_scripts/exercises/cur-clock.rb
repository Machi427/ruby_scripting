#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

init_screen
y = lines - 3

begin
  clockwin = stdscr.subwin(1, cols-3, 0, 0)
  t = Thread.new {
    while true
      clockwin.setpos(0, 0)
      clockwin.addstr(Time.now.to_s)
      clockwin.refresh
      stdscr.refresh
      sleep 0.1
    end
  }
  clear
  setpos(y, 0)
  addstr "名前を入れて: "
  name = getstr.chomp
  setpos(y+1, 0)
  addstr "食べたいものは: "
  food = getstr.chomp
ensure
  close_screen
end
