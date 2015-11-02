#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

TkOption.add("*font", "ipagothic 20")
menubar = TkFrame.new {
  relief	"raised"
  borderwidth	3
}.pack("fill"=>"x")

menu_f = TkMenubutton.new(menubar) {
  text "File"
  underline 0
}.pack("side"=>"left")
menu_e = TkMenubutton.new(menubar) {
  text "Edit"
  underline 0
}.pack("side"=>"left")

filemenu = TkMenu.new(menu_f, "title"=>"ファイルメニュー")
filemenu.add('command',
             "label"=>"O 開く",
             "command"=>proc {puts "open"},
             "underline"=>0)
filemenu.add('command',
             "label"=>"C 閉じる",
             "command"=>proc {puts "close"},
             "underline"=>0)
filemenu.add('separator')
filemenu.add('command',
             "label"=>"Q 終了",
             "command"=>"exit",
             "underline"=>0)

editmenu = TkMenu.new(menu_e, "title"=>"編集メニュー")
editmenu.add('command',
             "label"=>"C コピー",
             "background"=>"pink",
             "command"=>proc{puts "copy"},
             "underline"=>0)
editmenu.add('command',
             "label"=>"X カット",
             "command"=>proc{puts "cut"},
             # "columnbreak"=>1,	# 次の行に行く
             "underline"=>0)
editmenu.add('command',
             "label"=>"V ペースト",
             "command"=>proc{puts "paste"},
             "underline"=>0)

zoom = TkVariable.new("100")
zoommenu = TkMenu.new(menu_e)

zoommenu.add("radiobutton",
             "label"=>"50%",
             "variable"=>zoom,
             "value"=>"50",
             "command"=>proc{
               puts zoom.value
               zoom.value="50"
             },
             "underline"=>0,
             "indicatoron"=>true)
zoommenu.add("radiobutton",
             "label"=>"100%",
             "variable"=>zoom,
             "value"=>"100",
             "underline"=>0,
             "indicatoron"=>true)
zoommenu.add("radiobutton",
             "label"=>"200%",
             "variable"=>zoom,
             "value"=>"200",
             "underline"=>0,
             "indicatoron"=>true)

zoommenu.add("command",
             "label"=>"see zoom",
             "underline"=>0,
             "command"=>proc {STDERR.puts zoom.value})
editmenu.add('cascade',
             "label"=>"Z ズーム",
             "menu"=>zoommenu,
             "underline"=>0)


menu_f.menu(filemenu)
menu_e.menu(editmenu)

TkScrollbar.new {|s|
  pack("side"=>"right", "fill"=>"y")
  TkText.new("width"=>40, "height"=>10, "bg"=>"#f8f0f0") {|t|
    yscrollbar(s)
    # 第3ボタンクリックでzoommenuを出す
    bind('Button-3', proc{|x, y| zoommenu.popup(x, y)}, "%X %Y")
  }.pack("side"=>"right")
}
Tk.mainloop
