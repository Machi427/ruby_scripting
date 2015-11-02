#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'open3'
prog = "./ioe.sh"

STDERR.print "指定した月数分だけカレンダーを出力します。
何ヶ月分出しますか: "
n = gets.to_i                   # 英字だけなどは0になる。
Open3.popen3(prog) do |i, o, e|
  Thread.new {                  # 子プロセスの標準入力
    i.puts n.to_s               # つまり自分(親)からの出力
    i.close
  }
  Thread.new {
    while line=e.gets		# 子プロセスの標準エラー出力
      # ここでは特に処理しない
    end
  }
  while line=o.gets             # 子プロセスの標準出力
    print line
  end
end
