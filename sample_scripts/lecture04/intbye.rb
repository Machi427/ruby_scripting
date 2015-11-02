#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
def bye()
  Signal.trap(:INT, nil)        # ここでのSIGINT(C-c)は無視
  STDERR.puts "そんなー。"
  sleep 1
  STDERR.puts "でもサヨナラ"
  exit 1
end

Signal.trap(:INT, proc {bye})	# SIGINTハンドラを bye メソッド呼び出しに
puts "C-cキーでは止まりません。押してみてください。"
10.downto(0) do |i|
  STDERR.printf("%d..", i)
  sleep 1
end
STDERR.puts "0 おしまい!"
