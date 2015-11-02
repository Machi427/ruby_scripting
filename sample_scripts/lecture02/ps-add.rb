#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'pstore'
datafile = "ps-data"		# データを保存するファイル名

# 初期値のハッシュをPStoreファイルに保存
# このプログラムを3回実行したのち ls -l でデータファイル生成を確認し、
# さらに ps-list.rb を実行する

db = PStore.new(datafile)
db.transaction do
  m = db["山のデータ"] = db.fetch("山のデータ", Hash.new)
  # これでmが保存可能なハッシュになる
  m["富士山"]	= 3776
  m["月山"]	= 1984
  m["鳥海山"]	= 2236

  e = db["偶数"] = db.fetch("偶数", Array.new)
  # これで e が保存可能な配列になる
  e << 2
  e << 4
  e << 6	# 2、4、6を順次配列に追加する
end
