#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'yaml/store'

mydir	= File.dirname($0)      	# プログラムの存在するディレクトリ
prefix	= File.expand_path("..", mydir)	# PREFIXを求める
myname	= File.basename($0, ".rb")	# .rb を取り除いた名前
score	= File.expand_path("share/#{myname}.score", prefix) # スコアファイル
user	= ENV["USER"]			# ユーザ名
rank	= nil				# ランキング用変数を宣言しておく

answer = rand(10)			# ゲーム部分のはじまり
STDERR.printf("入力せよ: %d\n", answer)
t0 = Time.now.to_f			# 値入力前の時刻
while true
  break if gets.to_i == answer
end
record	= Time.now.to_f - t0		# このrecordでハイスコアを決める
now	= Time.now.strftime("%F %T")	# 達成日時
thisrecord = [user, record, now]

db = YAML::Store.new(score)		# ハイスコアファイルはyamlとする
db.transaction do
  rank = db["hiscore"] = db.fetch("hiscore", Array.new) # ランキング取り出し
  rank << thisrecord			# 今回のスコアを取り敢えず突っ込む
  rank.sort_by!{|x| x[1]}		# 各レコード先頭要素でソート
  rank = rank[0..9]			# 最大10個にする
end
r=rank.index(thisrecord)
0.upto(rank.length-1) do |i|
  printf("%s%2d: %20s | %5.3f | %s\n", r==i ? "*" : " ", i+1, *rank[i])
end
r and printf("おめでとう! %d位にランクイン!\n", r+1)
