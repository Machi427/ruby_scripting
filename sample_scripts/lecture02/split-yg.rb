#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

while line=gets
  data = line.chomp.split(",")
  if /\d+/ =~ data[7]			# 第8フィールドが数字の連続なら
    printf("%s,%s\n", data[6], data[7])
  end
end
