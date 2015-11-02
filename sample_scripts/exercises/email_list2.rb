#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'resolv'			# resolvライブラリ利用

def email_list()
  r = Resolv::DNS.new			# リゾルバを初期化
  t = Resolv::DNS::Resource::IN::ANY	# レコードタイプANYで問い合わせ
  list = open("emails.txt"){|e| e.readlines}.select {|d|
    local, domain = d.chomp.split("@")	# '@' の前後で分割
    if domain				# @以後があるなら
      begin
        x = r::getresource(domain, t)
        true				# なくてもいいが明示的にtrueを返す
      rescue				# 問い合わせ失敗なら
        false				# falseを返す
      end
    end
  }.collect{|i| i.chomp}		# 行末改行も削除しておく
end

printf("Valid domains: \n%s\n", email_list.join("\n"))
