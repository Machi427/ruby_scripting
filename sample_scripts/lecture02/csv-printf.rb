#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'csv'			# csvライブラリの利用

CSV.foreach("quoted.csv") do |row|
  printf("%4s|%-16s|%-25s|%s\n", *row)
end
