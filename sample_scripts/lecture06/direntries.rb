#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
checkdir = ARGV.shift || "."
printf("(1)ここは%s\n", Dir.pwd)
printf(%Q/"%s" ディレクトリのエントリ一覧\n/, checkdir)
files = Dir.entries(checkdir)

printf(%Q/先頭要素は必ず  "%s"\n/, files.shift)
printf(%Q/2番目要素は必ず "%s"\n/, files.shift)
print("残りは登録順: ")
$KCODE=ENV["LC_ALL"] || ENV["LANG"] || 'u'
p files

puts "-"*15+"サイズ一覧"+"-"*15
files.each do |f|
  file = File.expand_path(f, checkdir)
  size = File.stat(file).size
  printf("%-30s %6d\n", f, size)
end
