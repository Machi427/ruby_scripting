#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
# Ruby1.9 Ready
# cursesを用いて●を動かす
require 'curses'
include Curses
noecho                          # エコーバックなし
cbreak                          # Returnなしで即入力
Curses.timeout = 0		# 入力は待たない

init_screen			# 画面も消える
ball = "●"
kesu = "  "
wait = 0.03			# タイマー

x = 0
y = lines-2			# 下から2行目
j = 0                           # ジャンプの高さ
jmax = 6                        # 2ステップ分高度をあげる
jnow = 0                        # 現在のステップ(0〜3)

setpos(1, 0)
addstr("SPCでジャンプ!")
setpos(y-5, cols/2+rand(3))     # ランダムに決めた位置に
addstr("★")                    # ★を置く
begin
  h = y-1                       # 高さの初期値をセットしておく
  while x < cols		# 右から左へ
    setpos(h, x-1)		# カーソルを今の位置へ
    addstr(kesu)		# 前のボールを消す
    x += 1
    h = y-1 - ((jmax-jnow)*jnow/2) # ジャンプは2次曲線
    setpos(h, x-1)		# カーソルを次の位置へ
    addstr(ball)		# ボールを書く
    setpos(0,0)			# カーソルを邪魔でないところへ
    refresh                     # これをしないと画面に反映されない
    if jnow > 0 then
      jnow -= 1                 # ジャンプ中の処理
      getch                     # ジャンプ中に押されたキーは捨てる
    else
      key = getch
      if key == " "[0]          # SPCだったら
        jnow = jmax             # ジャンプ開始
      end
    end
    sleep(wait)			# 一定時間休む
  end
  setpos(y-1, 0)
  addstr("おしまい\n")
  refresh                       # 最後も忘れずに
  sleep 3
ensure
  close_screen
end
