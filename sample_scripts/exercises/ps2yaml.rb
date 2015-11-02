#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'pstore'
require 'yaml/store'
diarydb = 'diary.pstore'
diaryyaml = 'diary.yaml'

db1 = PStore.new(diarydb)
db2 = YAML::Store.new(diaryyaml)

db1.transaction do
  db2.transaction do
    diary1 = db1["diary"] = db1.fetch("diary", Hash.new)
    diary2 = db2["diary"] = db2.fetch("diary", Hash.new)
    diary1.each do |key, val|
      diary2[key] = val
    end
  end
end
