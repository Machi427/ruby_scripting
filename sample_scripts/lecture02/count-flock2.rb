#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# ロック処理を追加 (ロック時間短縮版)

dbfile = "counter"
lockfile = dbfile + ".lck"      # ロックに使うダミーファイル
require 'dbm'

STDERR.print "いくつ足しますか: "
x = STDIN.gets.to_i             # 加算値を先に読み込んでおく
open(lockfile, "w") do |lf|
  lf.flock(File::LOCK_EX)       # ロック設定
  STDERR.puts "#{dbfile} に対する作業開始"
  DBM.open(dbfile) do |c|       # 変数cのハッシュがDBMファイルに直結
    count = c["count"].to_i
    STDERR.printf("現在の値は%dです。", count)
    c["count"] = count+x        # データを更新して終了
  end
  STDERR.puts "作業終了"
  lf.flock(File::LOCK_UN)
end
