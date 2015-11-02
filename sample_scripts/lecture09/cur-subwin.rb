#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'curses'
include Curses

def winbox(win, scroll, tcolor) # 枠を付け文を出し続けるメソッド
  win.box("|"[0], "-"[0])       # まず枠を付ける
  # 次に子ウィンドウを枠の内部に作成
  subw = stdscr.subwin(win.maxy-2, win.maxx-2, win.begy+1, win.begx+1)
  subw.scrollok(scroll)         # スクロールの許可を決める
  win.setpos(0, 2)              # 枠を上書きする位置にタイトル表示
  win.addstr(sprintf("[スクロール %s]", scroll.inspect))
  win.refresh                   # winに対する変更を反映
  # 以後は内部の子ウィンドウに対する処理のみ
  subw.setpos(0, 0)             # 子ウィンドウの左上隅に移動しておく
  i = 0
  while true                    # 枠内に「n行目\n」を永遠に出し続ける
    subw.attron(color_pair(tcolor)) do
    	subw.addstr(sprintf("%2d行目\n", i+=1))
    end
    subw.refresh
    # refresh			# このrefreshの有無でカーソル位置が違う
    sleep 0.1
  end
end

begin
  init_screen
  has_colors? or abort("この端末では色が使えません。")
  cols>=72 && lines>=20 or abort("端末の大きさ72x20以上で起動してください。")

  start_color
  init_pair(1, COLOR_RED, COLOR_WHITE)    # 1=白地に赤
  init_pair(2, COLOR_YELLOW, COLOR_BLACK) # 2=黒地に黄

  leftwin = stdscr.subwin(10, 30, 10, 05) # 左側子ウィンドウ作成
  rightwin = stdscr.subwin(10, 30, 5, 40) # 右側子ウィンドウ作成
  t1 = Thread.new do                      # 左窓を操作するスレッド生成
    winbox(leftwin, true, 1)		  # 第2引数がスクロール指定
  end
  t2 = Thread.new do            	  # 右窓を操作するスレッド生成
    winbox(rightwin, false, 2)		  # 第2引数がスクロール指定
  end
  setpos(0, 0)                  # 画面先頭にメッセージ出力
  attron(color_pair(2)) {
  addstr("何かキーを押すと止まります")
  }
  refresh
  getch                         # 1字読み捨てて終了
  # t1.kill; t2.kill
ensure
  close_screen
end
