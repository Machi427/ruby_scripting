#!/usr/bin/env ruby
exec("/bin/ls")			# ここでexecしてプロセスが完全に置き換わる
puts "Hello!!!"			# ここは実行されるか?
