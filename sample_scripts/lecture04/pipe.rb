#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

repeat = (ARGV[0] || 5).to_i
io = IO.pipe
io[1].puts "あいうえお "*repeat
io[1].flush
print io[0].gets
