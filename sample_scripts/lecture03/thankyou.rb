#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'nkf'

sender	= ENV['SENDER']		# 環境変数SENDERの値の取得
rcpt	= ENV['RECIPIENT']	# 環境変数RECIPIENTの値の取得

if sender == nil || rcpt == nil then
  STDERR.puts "$SENDER and $RECIPIENT not set. exit."
  exit 0		# メイル用プログラムはエラーでも exit 0 すべき
elsif /.*@.*/ !~ sender then    # メイルアドレス形式でない場合
  STDERR.puts "SENDER address invalid"
  exit 0
end

to	= sender
from	= rcpt
subject = NKF.nkf("-jM", 'メイル受信しました')
header	= sprintf("To: %s
From: %s
Subject: %s
Content-type: text/plain; charset=iso-2022-jp
Mime-Version: 1.0\n\n", to, from, subject)
message	= NKF.nkf("-j", "ありがとう\n")
program	= sprintf("| sendmail -f %s %s", from, to)

open(program, "w") do |mail|
  mail.print header
  mail.print message
end
