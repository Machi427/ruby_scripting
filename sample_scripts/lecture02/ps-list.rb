#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'pstore'
datafile = "ps-data"

# datafileに登録されているものを取り出す。
db = PStore.new(datafile)
db.transaction do
  m = db["山のデータ"] = db.fetch("山のデータ", Hash.new)
  e = db["偶数"] = db.fetch("偶数", Array.new)
  # 既存データがある場合でも同じ代入方法でよい
  puts("山のデータのハッシュ")  # mを順次出力
  for k, v in m
    printf("%s\t-> %4d\n", k, v)
  end
  puts("偶数の配列")            # mを順次出力
  puts e.join(", ")
end
