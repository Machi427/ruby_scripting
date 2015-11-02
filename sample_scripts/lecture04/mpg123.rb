#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

if !ARGV[0]
  STDERR.puts "再生したいファイルを指定してください。\n用法:"
  STDERR.puts "\t#{$0} <MP3ファイル(群)>"
  exit 1
end
frame = nil                     # 生成中フレーム# の保存用
e = IO.pipe                     # mpg123からは標準エラー出力のみ読み取る

pid = fork do                   # fork&exec を行なう。PIDを記憶。
  STDERR.printf("ちわ，子です。%s を演奏します。", ARGV.join(" "))
  STDERR.reopen(e[1])
  e[0].close                    # 入力端は使わないので閉じる
  exec "mpg123", "-v", *ARGV    # *ARGVで配列を展開して渡す
end
# ここから親の処理
e[1].close                      # 親の出力端は使わないので閉じる

def prompt(file)
  STDERR.printf("\n[%s]再生中 - コマンド(nで次の曲，qで終了): ", file)
end

Thread.new do                   # 子プロセス(mpg123)と通信するスレッド
  while not e[0].closed?
    line = ""
    while l = e[0].getc         # 1字ずつ読み、lineに足していく。
      if l != "\r"[0] && l != "\n"[0]   # CRかLF以外なら
        line << l.chr           # lineに追加
      else                      # CRかLFが来たら行(line)の完成
        break                   # ループを抜けてパターンマッチに移る
      end
    end
    if /Frame\#\s*(\d+)/n =~ line
      STDERR.printf "%s ", $1 if $DEBUG
      frame = $1.to_i
    elsif /stream .* (.+) \.\.\./n =~ line
      prompt($1)          # 再生ファイル名パターンが来たらプロンプト出力
    end
  end
end

Thread.new do			# プロセスの終了を監視するスレッド
  Process.wait                  # mpg123終了まで待機
  printf("Stopping at frame %s\n", frame)
  exit 0                        # mpg123が終了したらこのプログラムも終わる。
end

while true
  a = STDIN.gets                # promptが出ているはず
  if a.nil? || /q/ =~ a
    Process.kill(:INT, pid)     # mpg123コマンドに
    Process.kill(:INT, pid)     # 2連続でINTシグナルを送ると終了
    break
  elsif /n/ =~ a
    Process.kill(:INT, pid)     # 1回INTシグナル送信で次の曲へ
  end
end
