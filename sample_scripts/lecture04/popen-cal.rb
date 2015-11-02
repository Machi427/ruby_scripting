#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
lineno = 0                      # 行番号を付ける
IO.popen("cal", "r") do |c|
  while line=c.gets
    printf("%d: %s", lineno+=1, line)
  end
end
