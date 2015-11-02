#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

def email_list()
  list = open("emails.txt"){|e| e.readlines}.select {|d|
    local, domain = d.split("@")	# '@' の前後で分割
    if domain				# @以後があるなら
      r = `host #{domain}`
      $?.to_i == 0
    end
  }.collect{|i| i.chomp}		# 行末改行も削除しておく
end

printf("Valid domains: \n%s\n", email_list.join("\n"))
