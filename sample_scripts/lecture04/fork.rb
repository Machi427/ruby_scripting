#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
$stdout.sync = true		# 標準出力を溜めずにすぐ書き出すため
def message(me)
  0.upto(4) do |i|
    printf("%sその%d\n", me, i+=1)
    sleep 1
  end
end

pid = fork                      # forkによってプロセスの分身発生
if pid then
  printf("こちらは親(pid=%d)\n", pid)
  message("親")
else				# 分身側のプロセス
  sleep 0.5
  message("\t分身")
end
