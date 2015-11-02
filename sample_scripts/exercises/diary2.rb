#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'pstore'
diarydb = 'diary.pstore'

db = PStore.new(diarydb)
db.transaction do
  diary = db["diary"] = db.fetch("diary", Hash.new)
  diary.each do |date, desc|
    printf("【%s】\n%s", date, desc)
  end
end
