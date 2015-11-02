#!/usr/bin/env ruby

pattern = Regexp.new(ARGV.shift) # 第1引数はパターン
print ARGF.readlines.grep(pattern).join
