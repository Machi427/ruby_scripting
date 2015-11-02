#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#Foretune teller - version 0
ftune	= %w,大吉 吉 中吉 小吉 半吉 末吉 小凶 凶,
outfile	= "fortune.txt"
srand
result = ftune[rand(ftune.length)]
open(outfile, "w") do |f|
  f.printf("今日の運勢は %s\n", result)
end
STDERR.puts "#{outfile}を見よ。"
