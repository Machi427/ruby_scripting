#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

x = 1
t = Thread.new do
  # ここは子のみが実行するところ
  5.times do
    STDERR.print("\e[32m")      # 子スレッドが走るときに端末文字色を緑に
    x=5; sleep 0.2
  end
end
while t.alive?
  STDERR.printf("\e[mx=%dに1足すと:", x) # ESC [ m で標準色に戻す
  sleep 0.05
  x += 1
  STDERR.printf("%d\n", x)
end
t.join
