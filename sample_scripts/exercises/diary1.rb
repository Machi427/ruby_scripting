#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'pstore'
diarydb = 'diary.pstore'

db = PStore.new(diarydb)
db.transaction do
  diary = db["diary"] = db.fetch("diary", Hash.new)
  STDERR.print "日記の日付を入力してください(YYYY-MM-DD): "
  date = gets.chomp
  STDERR.puts "文章を入力してください(終了は行頭で C-d):"
  desc = readlines.join
  diary[date] = desc
end
