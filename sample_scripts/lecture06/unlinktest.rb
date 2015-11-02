#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
tmpfile = ARGV.shift || "00TEMPFILE"
tmpdir  = File.dirname(tmpfile)

STDERR.puts "最初のこのディレクトリの使用量:"
system "du -sk #{tmpdir}"
open(tmpfile, "w+") do |tf|
  1.upto(10) do |lineno|
    tf.printf("これは%02d行目\n", lineno)
  end
  tf.puts "-"*1024*1024         # 1MBのダミーデータ
  tf.flush                      # バッファを書き込み
  tf.rewind                     # ファイルポインタを先頭に
  system "ls -lF #{tmpfile}"
  STDERR.puts "ファイル作成直後のこのディレクトリの使用量:"
  system "du -sk #{tmpdir}"
  STDERR.puts "改行を押すとこのファイルを消します。"
  STDIN.gets
  File.unlink(tmpfile)
  system "ls -lF #{tmpfile}"
  STDERR.puts "closeする前のこのディレクトリの使用量:"
  system "du -sk #{tmpdir}"
  STDERR.puts "1行目から読みます。"
  STDERR.puts "別の端末でlsして#{tmpfile}がないことを確認しましょう。"
  10.times do |l|
    print tf.gets
    sleep 1
  end
end
STDERR.puts "closeされたあとのこのディレクトリの使用量:"
system "du -sk #{tmpdir}"
