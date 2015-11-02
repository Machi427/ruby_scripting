#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require './kprintf.rb'
require 'pstore'
datafile = 'pricedb'

def showall(hash)
  for k, v in hash
    printf("%-20s%4d円\n", k, v)
  end
end

db = PStore.new(datafile)
db.transaction do
  price = db["price-list"] = db.fetch("price-list", Hash.new)
  while true
    STDERR.print "商品=単価  の形式で入れてください(C-dで終了): "
    break if (line=gets) == nil
    redo if /([^=]*)=([\d ]*)/ !~ line # マッチしなかったら redo
    price[$1] = $2.to_i
  end
  puts "\n全商品リストです"
  showall(price)
end
