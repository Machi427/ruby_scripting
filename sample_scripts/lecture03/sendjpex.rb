#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'nkf'
subj = '日本語サブジェクト'
body = 'こんにちは，
さようなら。'

if ARGV[0] == nil then
  STDERR.puts "送り先アドレスを指定してください。"
  STDERR.puts " 例: #{$0} toaddress@example.jp"
  exit 1
end

command = sprintf("| sendmail %s", ARGV[0])
header = sprintf("To: %s
Subject: %s
Content-type: text/plain; charset=iso-2022-jp
Mime-Version: 1.0\n\n", ARGV[0], NKF.nkf('-jM', subj))
open(command, "w") do |mail|
  mail.print header
  mail.print NKF.nkf('-j', body)
end
