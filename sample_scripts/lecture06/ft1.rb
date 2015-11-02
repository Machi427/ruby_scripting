#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#Foretune teller - version 1
ftune	= %w,大吉 吉 中吉 小吉 半吉 末吉 小凶 凶,
outfile	= "fortune.txt"
srand
result = ftune[rand(ftune.length)]

if test(?w, ".") then		# ディレクトリの書き込み権限を確認
  if test(?s, outfile) then
    ext = File.extname(outfile)
    bak = File.basename(outfile, ext)+".bak"
    File.rename(outfile, bak)
  end
  open(outfile, "w") do |f|
    f.printf("今日の運勢は %s\n", result)
  end
  STDERR.puts "#{outfile}を見よ。"
end
