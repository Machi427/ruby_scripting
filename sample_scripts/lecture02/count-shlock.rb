#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# 共有ロック処理 (共有ロックのプログラムだけなら同時に何個でも起動できる)

dbfile = "counter"
lockfile = dbfile + ".lck"      # ロックに使うダミーファイル
require 'dbm'
open(lockfile, "w") do |lf|
  lf.flock(File::LOCK_SH)       # 共有ロック設定
  STDERR.puts "#{dbfile} に対する作業開始"
  DBM.open(dbfile) do |c|
    count = c["count"].to_i
    STDERR.printf("現在の値は%dです。\n", count)
  end
  sleep 10              # 同時起動の実験をするため敢えて時間をかける
  STDERR.puts "作業終了"
  lf.flock(File::LOCK_UN)
end
