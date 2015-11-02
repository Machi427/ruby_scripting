#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

stop = false
bakudan = Thread.new do
  # 子スレッドのブロック
  puts ''                       # 1行空けておく
  begin
    timer = 11
    while true
      Thread.stop if stop       # stop変数が真ならスレッド実行停止
      # ESC 7 はカーソル位置保存，ESC [ 1 A は1行上，ESC 8 は位置復帰
      STDERR.printf("\e7\e[1A\r爆発 %2d秒前  \e8", timer-=1)
      break if timer < 1
      sleep 1
    end
  ensure
    puts "\nどかあああーーん!!" # 何をやっても必ず実行(ensureブロック)
    exit
  end
end

# メインスレッドのループ
sleep 0.01                       # こちらが僅かにあとで実行されるよう
while bakudan.alive? do
  STDERR.print "コマンド入力(a〜zのどれか):  \b"
  cmd = gets.chomp
  case cmd
  when "s"
    if stop then
      bakudan.run
      stop = false
    else
      stop = true
    end
  when "k"
    STDERR.puts "壊してみよう(Thread.kill)"
    bakudan.kill
    break
  when "q"
    STDERR.puts "逃げてみよう(exit)"
    exit
  end
  STDERR.print "\e[1A"                 # 1行上に戻しておく
end
puts ''
