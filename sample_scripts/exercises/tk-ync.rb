#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'

message  = ARGV[0] || "よろしいですか"
case Tk.messageBox("icon" => "question",
                   "message" => message,
                   "type" => "yesnocancel")
when "yes"
  exit 0
when "no"
  exit 1
when "cancel"
  exit -1
end
