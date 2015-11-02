#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'tmpdir'              	# Dir.mktmpdir に必要
begin
  Dir.mktmpdir do |dname|
    Dir.chdir(dname) do
      printf("%s で一時ファイル作成\n", dname)
      open("hoge", "w") do |a| a.puts("hoge") end
      print `ls -laF`
      printf("1秒sleepします。C-cで止めても%sは消えます。\n", dname)
      sleep 1
    end
  end
rescue
  abort "#{tmp} 内に一時ディレクトリを作れませんでした.
環境変数 TMPDIR に書き込み可能なディレクトリを設定して再度起動してください。"
end
