#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
prog = "./ioe.sh"

STDERR.print "指定した月数分だけカレンダーを出力します。
何ヶ月分出しますか: "
n = gets.to_i                   # 英字だけなどは0になる。

i = IO.pipe                     # 子プロセスの標準入力とのパイプ
o = IO.pipe                     # 子プロセスの標準出力とのパイプ
e = IO.pipe                     # 子プロセスの標準エラー出力とのパイプ
STDOUT.flush

if pid=fork
  # ここは親プロセス
  o[1].close                    # (あ)パイプその2出力端
  e[1].close                    # (あ)パイプその3出力端
  i[1].puts n.to_s		# (い)
  i[1].close                    # 書き出しが終了したのでクローズ
  i[0].close                    # 以下，使わないのでクローズ
  while line=o[0].gets		# (う)ioe.shからの出力を読み取る
    print ":"+line		# コロンを付けて出力
  end
else
  # ここは子プロセス
  STDIN.reopen(i[0])            # (イ)STDINの置き換え
  STDOUT.reopen(o[1])           # (ロ)STDOUTの置き換え
  STDERR.reopen(e[1])           # (ハ)STDERRの置き換え
  i[1].close			# (ニ)パイプその1の出力端
  o[0].close			# (ニ)パイプその2の入力端
  e[0].close			# (ニ)パイプその3の入力端
  exec(prog)
end
