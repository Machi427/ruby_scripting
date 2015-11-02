#!/usr/bin/env ruby
require 'dbm'
DBM.open(ARGV[0]){|d| d.each{|i| printf("%s %s\n", *i)}}
