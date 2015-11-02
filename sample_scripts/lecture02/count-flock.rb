#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# ロック処理を追加 (ただしロック時間が無駄に長いのでのちに改善)

dbfile = "counter"
lockfile = dbfile + ".lck"      # ロックに使うダミーファイル
require 'dbm'
open(lockfile, "w") do |lf|
  lf.flock(File::LOCK_EX)       # ロック設定
  STDERR.puts "#{dbfile} に対する作業開始"
  DBM.open(dbfile) do |c|       # 変数cのハッシュがDBMファイルに直結
    count = c["count"].to_i
    STDERR.printf("現在の値は%dです。\nいくつ足しますか: ", count)
    count += STDIN.gets.to_i    # 読み込んだ数を加算
    c["count"] = count          # データを更新して終了
  end
  STDERR.puts "作業終了"
  lf.flock(File::LOCK_UN)
end
