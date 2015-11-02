#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'
require 'tkextlib/tkimg/png'

img = TkPhotoImage.new("file"=>ENV["IMG"]||"ball.png")
$top = img.height*2
$base = $top - img.height/2
$e = 0.8
def gety(t)
  # y = -(x-1)^2 + 1
  x = ((t-10)%20)/10
  # amp = $top * $e ** (t/20.to_i)
  y = -(x-1.0)**2 + 1.0
  return $base - $top*y/2
end

wait = TkVariable.new('50')
TkCanvas.new {|c|
  width img.width*3
  height $top
  cx = width/2; cy = $base
  ball = TkcImage.new(c, cx, cy, "image"=>img)
  i = 0.0
  tm = TkAfter.new(proc{val=wait.value}, -1, 
                   proc {ball.coords(cx, gety(i+=1))
                   }).start
  TkScale.new {
    variable wait
    to(100)
    from(1)
    label 'wait'
  }.pack('side'=>'left')
  TkButton.new("text"=>"stop", "command"=>proc{tm.stop}).pack("side"=>"left")
  TkButton.new("text"=>"start", "command"=>proc{tm.continue}).pack("side"=>"left")
  TkButton.new("text"=>"quit", "command"=>"exit").pack("side"=>"left")
}.pack
Tk.mainloop
