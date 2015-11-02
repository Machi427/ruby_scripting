#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nkf'

sender	= ENV['SENDER']		# 環境変数SENDERが送信者
rcpt	= ENV['RECIPIENT']	# 環境変数RECIPIENTが受信アドレス

if sender == nil || rcpt == nil then
  STDERR.puts "$SENDER and $RECIPIENT not set. exit."
  exit 0		# メイル用プログラムはエラーでも exit 0 すべき
elsif /.*@.*/ !~ sender then    # メイルアドレス形式でない場合
  STDERR.puts "SENDER address invalid"
  exit 0
end

kuji	= ["大吉", "吉", "中吉", "小吉", "末吉", "凶", "大凶"]
result	= kuji[rand(kuji.length)]	# 乱数でいずれかの結果を得る
to	= sender
from	= rcpt
subject = NKF.nkf("-jM", '本日の運勢')
header	= sprintf("To: %s
From: %s
Subject: %s
Content-type: text/plain; charset=iso-2022-jp
Mime-Version: 1.0\n\n", to, from, subject)
message	= NKF.nkf("-j", sprintf("今日の運勢は「%s」です。\n", result))
program	= sprintf("| sendmail -f %s %s", from, to)

open(program, "w") do |mail|
  mail.print header
  mail.print message
end
