#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

filename = Time.now.strftime("%F") + ".txt"

# ヘッダを捨てる。
while true
  break if /^$/ =~ gets
end

# 残りは本文。ファイルに保存する。
open(filename, "w") do |txt|
  txt.print readlines
end
