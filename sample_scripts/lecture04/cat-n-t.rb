#!/usr/bin/env ruby
# ./cat-n-t.rb 5000 とすれば5000回。省略時1000回。

repeat = (ARGV[0] || 1000).to_i
IO.popen("cat -n", "r+") do |c|
  Thread.new {				# 別スレッドで整数文字列を
    0.upto(repeat) {|i| c.puts i}	# 一気に書き込み，
    c.close_write			# close_write する
  }
  while line=c.gets			# 元スレッドで読み込み続けprint
    print line
  end
end
