#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
cmd = ARGV[0] || "kterm"
# コマンドライン引数に指定した場合はそれを，しない場合はktermを起動

if (pid = fork()) then
  # 親プロセスのみ必要な処理はここ
else
  # 子プロセスのみの処理はここ
  exec(cmd)
end

STDERR.printf("%s について: 終了を待つ=w killする=k 放置=その他: ", cmd)
case STDIN.gets
when /^k/i
  STDERR.puts "ボシュっ"
  Process.kill(:QUIT, pid)
when /^w/i
  STDERR.puts "じゃ，待ちます。"
  Process.wait
else
  STDERR.puts "じゃ，わしゃ勝手に終わります。さいなら。"
end
