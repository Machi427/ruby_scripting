#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'tmpdir'              	# Dir.tmpdir に必要
tmp = Dir.tmpdir              	# テンポラリディレクトリを得る 既定値=/tmp
me = File.basename($0, ".rb")   # スクリプト自身のベース名
dname = nil                     # 一時ディレクトリ名保存用変数
0.upto(9) do |n|                # 10個の違うディレクトリ名で試行
  # ベース名とPIDに0〜9の番号を付けた名前とする
  dname = sprintf("%s/%s-%d.%d", tmp, me, $$, n)
  begin
    Dir.mkdir(dname, 0700)     	# 他ユーザにアクセスできない属性で
    break
  rescue                        # mkdirが失敗したら
    dname = nil                 # ディレクトリ名を消しておく
  end
end
if dname && test(?d, dname)     # mkdirに成功した場合
  begin
    # ここに一時ディレクトリを利用した処理を書く
    Dir.chdir(dname) do
      printf("%s で一時ファイル作成\n", dname)
      open("hoge", "w") do |a| a.puts("hoge") end
      print `ls -laF`
      printf("1秒sleepします。C-cで止めても%sは消えます。\n", dname)
      sleep 1
    end
  ensure
    # ここには後始末(一時ファイル消去)処理を書く
    # system "/bin/rm -rf '#{dname}'" # 外部コマンドrmに任せる場合
    require 'fileutils'
    FileUtils.remove_entry_secure(dname, :force)
  end
else
  abort "#{tmp} 内に一時ディレクトリを作れませんでした.
環境変数 TMPDIR に書き込み可能なディレクトリを設定して再度起動してください。"
end
