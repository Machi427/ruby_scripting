#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-

# 問と解を列挙。本来ファイルから読むべきだが主題はスレッドなので簡略化
questions = [
             ["この時間習っている言語は", "ruby"],
             ["ファイル一覧を出すコマンドは", "ls"],
             ["ファイルを表示・結合するコマンドは", "cat"],
             ["ファイルを削除するコマンドは", "rm"],
             ["ファイルを移動(リネーム)するコマンドは", "mv"]
  ]

n = 0                           # 問題番号
hit = 0                         # 正解数
$stdout.sync = true
for q, a in questions
  reply = nil
  t = Thread.new do
    printf("%c[2J%c[1;1H", 27, 27) # 画面消去のエスケープシーケンス
    printf("第%d問 %s: ", n+=1, q)
    reply = gets.chomp
    if reply == a then
      print("正解!")
      hit += 1
    else
      print("ハズレ!\n")
    end
    t.exit
  end
  sleep 5
  if t.alive? then
    t.kill
    print(" 残念!\n")
    sleep 1
  end
end
printf("\n%d問正解\n", hit)
if hit < questions.length/2 then
  print("トルネードです。ぐるぐるー\n")
end
