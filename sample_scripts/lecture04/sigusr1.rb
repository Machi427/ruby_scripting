#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class USR1
  def initialize                # .newで呼ばれるメソッド
    @counter = 0		# 数え上げていく変数
    printf("他の端末で kill -USR1 %d\n", $$)	# $$は Process.pid と同じ
    Signal.trap(:USR1, proc {reset})
    while true
      STDERR.printf("%d..", @counter+=1)
      sleep 1
    end
  end
  def reset
    @counter = 0		# USR1シグナルが送られたらカウンタをリセット
    STDERR.puts "リセット!"
  end
end

USR1.new
