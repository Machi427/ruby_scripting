#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
dir = ARGV.shift || "."

def cp(from, to, bufsize=8192)
  open(from, "r") do |src|
    open(to, "w") do |dest|
      while s = src.read(bufsize)
        dest.write s
      end
    end
  end
end

def bakdir(dir)
  ext = ".bak"
  Dir.foreach(dir) do |f|
    file = File.expand_path(f, dir)
    case f
    when ".", ".."              # カレントディレクトリと親ディレクトリ
      next                      # は飛ばす
    when %r,#{ext}$,		# それが既にバックアップファイルなら
      next  			# やはり飛ばす
    else
      if test(?d, file)         # ディレクトリなら
        bakdir(file)		# 再帰的に自分を呼ぶ
      elsif test(?f, file)      # 通常ファイルなら
        # バックアップファイル作成
        bak = File.expand_path(f+".bak", dir)
        File.unlink(bak) if test(?e, bak)
        cp(file, bak)
      end
    end
  end  
end

bakdir(dir)
