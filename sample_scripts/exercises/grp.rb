#!/usr/bin/env ruby
open("/etc/group", "r") do |g|
  while line = g.gets
    grp = line.split(":")
    printf("%s = %s", grp[0], grp[3])
  end
end
