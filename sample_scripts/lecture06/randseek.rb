#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

thisfile = "randseek.rb"        # このファイルの名前
sz = File.size(thisfile)
open(thisfile, "r") do |file|
  while true
    while line = file.gets
      print line
    end
    puts "読み終わりました。[Enter]でもう一度。やめたい場合は C-c"
    gets
    file.seek(rand(sz))         # 乱数でファイルポインタを移動
    printf("%dバイト目から読み直します。\n", file.pos)
  end
end
