#!/usr/bin/env ruby
# ./cat-n.rb 5000 とすれば5000回。省略時1000回。

repeat = (ARGV[0] || 1000).to_i
IO.popen("cat -n", "r+") do |c|
  0.upto(repeat) {|i| c.puts i}	# cat -n コマンドに指定数値まで
  c.close_write			# 文字列化した整数を送り続ける
  while line=c.gets		# cat -n コマンドからの出力を得てprint
    print line
  end
end
