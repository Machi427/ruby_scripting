#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
cmd = ARGV[0] || "kterm"

if (pid = fork()) then
  # 親プロセスのみ
  th = Process.detach(pid)
  t2 = Thread.new do
    th.join
    STDERR.puts "終わったようだ"
    exit 3
  end
else
  # 子プロセスのみの処理はここ
  begin
    exec(cmd)
  rescue
    STDERR.puts "\e[31m起動失敗\e[m"
    exit 1
  end
end

STDERR.printf("%s について: 終了を待つ=w killする=k 放置=その他: ", cmd)
k = STDIN.gets

if !th.alive? then
  STDERR.puts "と，思ったらこけちゃったみたい"
  exit 2
end
case k
when /^k/i
  STDERR.puts "ボシュっ"
  Process.kill(:QUIT, pid)
when /^w/i
  STDERR.puts "じゃ，待ちます。"
  Process.wait
else
  STDERR.puts "じゃ，わしゃ勝手に終わります。さいなら。"
end
