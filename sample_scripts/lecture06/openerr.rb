#!/usr/bin/env ruby

file = ARGV.shift || "nonexistent.txt"
open(file, "r") do |f|
  while line = f.gets
    print line
  end
end
