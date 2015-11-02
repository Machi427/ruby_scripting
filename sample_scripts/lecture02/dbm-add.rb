#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'dbm'                   # dbmクラスを利用
datafile = "./database"         # データベースファイル名

# CSVデータを読んでハッシュに入れておく
data = Hash.new
while csv=gets
  # 第1フィールドをキー，残りをごっそり文字列として値にする
  if /([^,]*),(.*)/ =~ csv
    data[$1] = $2
  end
end

# ndbm形式のデータベースを開く
DBM.open(datafile) do |x|
  # 開いた時点で既にデータがあれば x に入った状態でスタートする
  for key, val in data          # data の key, val ペアを取り出して繰り返す
    x[key] = val
  end
end
