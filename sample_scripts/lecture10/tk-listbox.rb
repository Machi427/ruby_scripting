#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkLabel.new("text"=>"何ラーメンにしますか?", "bg"=>"white").pack("fill"=>"x")
TkListbox.new {|men| # Listboxウィジェット自身が men に入る
  mode = TkLabel.new("text"=>"(1杯のみ)").pack # あとで値を変える
  insert("end", "塩")		# 末尾にアイテムを追加
  insert("end", "しょうゆ")
  insert("end", "味噌")
  insert(2, "とんこつ")		# 2番目の位置にアイテムを追加
  insert("end", "四川")
  selection_set(1)		# 明示的に選択する
  pack("side"=>"right")
  # 以下のボタンではListboxを持つブロック変数(men)にアクセスしたいので
  # ブロック内に記述してグローバル変数化せずに済ます。
  TkButton.new("text"=>"1杯のみ") {
    command(proc{
              men.selectmode = "single"		# 1つだけ選べる
              mode.text("(1杯のみ)")		# 連動してラベルを変える
              # 選ばれたものの添字の配列が curselection に入っている
              men.curselection[1..-1].each do |i|
                men.selection_clear(i)	# 明示的に選択解除
              end
            })
  }.pack("fill"=>"x")           # デフォルトは "side"=>"top"
  TkButton.new("text"=>"何種類も") {
    command(proc{
              men.selectmode = "extended"	# 何個でも選べる
              mode.text("(何種類も)")		# 連動してラベルを変える
            })
  }.pack("fill"=>"x")
  TkButton.new("text"=>"決定") {
    bg("#efe")
    command(proc{
              for i in men.curselection
                printf("%sラーメン一丁\n", men.get(i))
              end
            })
  }.pack("fill"=>"x")
}
TkButton.new("text"=>"店を出る") {
  bg("#ecc");  command(proc{exit})
}.pack("side"=>"bottom", "fill"=>"x")

Tk.mainloop
