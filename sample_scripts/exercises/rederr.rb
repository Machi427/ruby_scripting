#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

e = IO.pipe
pid = fork do
  STDERR.reopen(e[1])
  e[0].close                    # 子プロセスは読み込み端を閉じる
  exec(*ARGV)
end
e[1].close                      # 親プロセスは書き込み端を閉じる

Thread.new do
  while not e[0].closed?
    line = ""
    while err = e[0].gets
      STDERR.printf("\e[41m%s\e[m", err)
    end
  end
end
Process.wait
