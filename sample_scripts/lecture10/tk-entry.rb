#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

# 入力中の値を別のウィジェットで共有させることができる。
# それには同じ TkVariable を指定する。
vname = TkVariable.new("名無")

# Entryに何を入れるべきかのラベルを付ける。
# 桁が揃った方が気持ちよいので、グリッドマネージャを使う。
TkFrame.new() {|f|
  # f はフレーム自身。内部でnewするウィジェットは親にfを指定すること
  # l1 = TkFrame.new(f) {|f2|
  #   bg("yellow")
  #   TkLabel.new(f2, "text"=>"名前?:", "justify"=>"left", "bg"=>"yellow") {
  #     pack("side"=>"left", "fill"=>"both")
  #   }
  # }
  l1 = TkLabel.new(f, "text"=>"名前は?:")
  e1 = TkEntry.new(f, "bg"=>"pink", "textvariable"=>vname)
  l2 = TkLabel.new(f, "text"=>"じゅうしょは?:")
  e2 = TkEntry.new(f, "bg"=>"pink")
  TkGrid(l1, e1, "sticky"=>"news")
  TkGrid.columnconfigure(f, 0, "weight"=>1)
  TkGrid(l2, e2, "sticky"=>"e")
  TkOption.add("*foreground", "#915711")
  n1 = TkLabel.new(f) {
    textvariable vname
  }
  n2 = TkLabel.new(f) {
    text("さん こんにちは")
  }
  TkGrid(n1, n2)
  TkButton.new(f) {
    text(" 登録 ")
    command(proc {
              printf("%sにおすまいの%sさんですね!\n5万円になります。\n",
                     e2.value, e1.value)
              exit(0)
            })
  }.grid("columnspan"=>2)
}.pack("fill"=>"both", "expand"=>true)
Tk.mainloop
