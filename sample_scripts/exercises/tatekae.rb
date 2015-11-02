#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'csv'

CSV.foreach("tatekae.csv") do |row|
  name, email, yen = row
  if yen && yen.to_i > 0 then
    open(email, "w") do |w|
      w.printf(<<_EOS_, name, yen.to_i)
%s 様:
日ごろより本塾にご協力を賜りありがとうございます。

さて先日の納会にお越しいただいた際にご負担いただきました
交通費(%d円)を当方負担としてお渡ししたいと思います。
次回お越しのときに印鑑をお持ちの上，受領くださいますようお願い致します。

葛戸書房 経理課
_EOS_
    end
  end
end
