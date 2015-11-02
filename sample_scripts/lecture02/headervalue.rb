#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Parse rfc5322 header and display summary

while line=gets
  break if /^$/ =~ line
  if /^(return-path|from): *(.*)/i =~ line then
    from = $2
  elsif /^subject: (.*)/i =~ line then
    subj = $1
  elsif /^date: (.*)/i =~ line then
    date = $1
  end
end

printf("%s: %sさんからの「%s」というメイルです。\n", date, from, subj)
