#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'dbm'                   # dbmクラスを利用
datafile = "./database"         # データベースファイル名

if ARGV[0] == nil then
  STDERR.puts "#{$0} -a [Data.csv]      Add record"
  STDERR.puts "#{$0} -d                 Dump database"
  STDERR.puts "#{$0} -s                 Search on database"
  exit 1
end

case ARGV.shift
when "-a"                       # データの追加登録
  # CSVデータを読んでハッシュに入れておく
  DBM.open(datafile) do |x|
    # DBM.openしてからデータ入力を行なう処理は好ましくない(後述)
    while csv=gets
      # 第1フィールドをキー，残りをごっそり文字列として値にする
      if /([^,]*),(.*)/ =~ csv
        x[$1] = $2
      end
    end
  end
when "-d"                       # 一覧出力
  DBM.open(datafile, 0666, DBM::READER) do |x|
    for key, val in x
      printf("%s -> %s\n", key, val)
    end
  end
when "-s"                       # 検索
  STDERR.print "検索キー: "
  kwd = STDIN.gets.chomp!       # STDIN無しだと -s というファイルから読む
  reg = Regexp.new(kwd, nil, "n")	# "n" 文字コード変換なしで検索
  DBM.open(datafile, 0666, DBM::READER) do |x|
    require 'kconv'
    for k, v in x
      if reg =~ k then          # マッチしたレコードのみ出力
        printf("%s -> %s\n", k, v)
      end
    end
  end
end
