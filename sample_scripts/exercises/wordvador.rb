#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

# 単語は予めシャッフルした配列にしておく
w = open(ENV["DICT"] || "/usr/share/dict/words").readlines.shuffle
miss = 0                        # ミスの回数
wait = 1.0                      # 単語が1桁部分進む間隔の基準値
level = 1                       # このレベルでwait値を割る
score = 0                       # プレイヤーのスコア
word = nil                      # 攻撃対象の英単語
begin
  init_screen
  x, y = 0, 2
  cbreak
  noecho
  stage = stdscr.subwin(1, cols, y, 0) # 英単語が進むサブウィンドウ
  stth = Thread.new {           # キー入力用のスレッド
    while true
      case stage.getch
      when word[0]
        word = word[1..-1]      # 先頭1字を削る
      else
        x = x*8/10              # 間違えたら80%に減らす
      end
    end
  }
  while miss < 3
    clear
    word = w.shift.chomp
    x = cols-word.length-2
    while x > 0                 # 単語表示桁が先頭になるまで繰り返す
      setpos(0,0)
      addstr(sprintf("Level:%3d  score:%5d  miss: %d  w=[%-32s]",
                     level, score, miss, word))
      stage.clear
      stage.setpos(0, x)
      stage.addstr(word)
      stage.setpos(0,0)
      stdscr.refresh
      stage.refresh
      if word == ""             # すべての文字を撃破したら
        level += 1              # レベルUPして次の単語へ
        break
      end
      sleep wait/level
      x -= 1
    end
    x <= 0 and miss+=1          # 先頭桁に到達したらミスカウントを増やす
    score += x
  end
  stth.kill                     # キー入力スレッドを停める
  clear
  setpos(lines/2, 0)
  addstr(sprintf("You've got %d points at level %d.\n", score, level))
  addstr("Hit enter to leave:")
  getstr
ensure
  close_screen
end
