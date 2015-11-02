#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

t = Thread.new {
  while true
    STDERR.printf("\e7\e[1;1H%s\e8", Time.now.to_s)
    sleep 0.1
  end
}
print("\e[2J\n")                # 画面クリア
STDERR.print "名前を入れて: "
name = gets.chomp
STDERR.print "食べたいものは: "
food = gets.chomp
