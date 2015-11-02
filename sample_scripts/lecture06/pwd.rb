#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
printf("(1)ここは%s\n", Dir.pwd)
Dir.chdir(File.expand_path("~")) do
  printf("(2)ここは%s\n", Dir.pwd)
end
printf("(3)ここは%s\n", Dir.pwd)
