#!/usr/bin/env ruby18

3.times do		# 全体を3回繰り返す
  12.times do		# STDOUT/STDERR 交互出力を12回繰り返す
    STDOUT.print "O"
    STDERR.print "E"
    STDOUT.flush
  end
  STDOUT.puts ""	# 12回終わったらSTDOUTに改行出力
end
STDOUT.puts "Done."
