#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class USR12
  def initialize
    @counter = 0
    printf("他の端末で kill -USR{1,2} %d\n", $$)
    Signal.trap(:USR1, proc {reset})
    Signal.trap(:USR2, proc {bye})
    while true
      STDERR.printf("%d..", @counter+=1)
      sleep 1
    end
  end
  def reset
    @counter = 0		# USR1シグナルが送られたらカウンタをリセット
    STDERR.puts "リセット!"
  end
  def bye
    STDERR.puts "さようなら"	# USR2シグナルが送られたら終了
    exit 0
  end
end

USR12.new
