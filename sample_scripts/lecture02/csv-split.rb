#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'csv'			# csvライブラリの利用

CSV.foreach("quoted.csv") do |row|
  puts row.join("|")		# 縦棒(|)でフィールドを区切って出力
end
