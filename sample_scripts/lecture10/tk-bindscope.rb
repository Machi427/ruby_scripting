#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

class Test
  def hogehoge
    puts "Hoge!"
  end
  def initialize
    @hello = "Hello"
    @path  = "pathpathpath"   # Tkで用いている変数なので上書きはよくないが...
    ohayo = "Ohayo"
    TkLabel.new("text"=>"変数確認") {
      bind("1", proc {
             printf("ohayo=%s\n", ohayo.inspect)
             printf("@hello=%s\n", @hello.inspect)
             printf("@path=%s\n", @path.inspect)
           })
    }.pack
    myself = self               # 現在のオブジェクトをローカル変数に記録
    TkLabel.new("text"=>"メソッド確認") {
      bind("1", proc {
             p self
             hogehoge                # エラーになり処理はここで停止
             self.hogehoge           # これもエラー
             myself.hogehoge         # これならOK
           })
    }.pack
    TkButton.new("text"=>"Exit", "command"=>proc{exit}).pack
  end
end
Test.new
Tk.mainloop
