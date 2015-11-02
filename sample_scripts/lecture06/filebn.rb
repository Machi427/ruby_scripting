#!/usr/bin/env ruby

printf("$0 = [%s].\n", $0)       # $0はこのプログラムを起動したときの名前
printf("My name is [%s].\n", File.basename($0))
printf("My root name is [%s].\n", File.basename($0, ".rb"))
