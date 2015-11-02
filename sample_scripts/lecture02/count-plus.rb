#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# ロックなしのまずい例

dbfile = "counter"
require 'dbm'
DBM.open(dbfile) do |c|         # 変数cのハッシュがDBMファイルに直結
  count = c["count"].to_i
  STDERR.printf("現在の値は%dです。\nいくつ足しますか: ", count)
  count += STDIN.gets.to_i      # 読み込んだ数を加算
  c["count"] = count            # データを更新して終了
end
