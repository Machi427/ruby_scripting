#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'pstore'
require 'nkf'

sender	= ENV['SENDER']		# 環境変数SENDERが送信者
vote	= ENV['DEFAULT']	# -default の default に相当する部分の名前
valid	= ["foo", "bar"]	# 有効投票対象のリスト

db = PStore.new("vote.pstore")	# 投票結果格納ファイル

def sendreport(to, sj, body)	# レポート送信メソッド(投票時に利用)
  from	= ENV['RECIPIENT']	# このプログラムの受信アドレスで発信
  subj	= NKF.nkf("-jM", sj)
  header = sprintf("To: %s
From: %s
Subject: %s
Content-type: text/plain; charset=iso-2022-jp
Mime-Version: 1.0\n\n", to, from, subj)
  message = NKF.nkf("-j", body)
  program = sprintf("| sendmail -f %s %s", from, to)
  open(program, "w") do |mail|
    mail.print header
    mail.print message
  end
end

db.transaction do
  v = db['vote'] = db.fetch('vote', Hash.new)
  # 環境変数SENDERの有無で処理を切り替える
  if ENV["SENDER"] && vote then
    # メイル経由なので投票処理
    if valid.index(vote) then	# 有効投票リストにあるなら投票処理
      v[sender] = vote		# 投票者をキーとする値を設定
      sendreport(sender, "投票完了", vote+"さんに投票しました。")
    else
      v.delete(sender)		# 投票者をキーとするものを削除
      sendreport(sender, "無効投票",
                 "次の候補者いずれかに投票してください: "+valid.join(", "))
    end
  else	# 環境変数設定がない場合は
	# コマンドライン起動と見なして集計処理
    count = Hash.new(0)			# デフォルト値0のハッシュ
    v.each {|k, v| count[v] += 1}	# 候補者名のカウントを増加
    valid.each do |p|
      printf("%10s: %5d票\n", p, count[p])
    end
  end
end
