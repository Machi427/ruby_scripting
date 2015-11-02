# -*- coding: utf-8 -*-
cv = TkCanvas.new('width'=>400, 'height'=>300).pack
Thread.new { Tk.mainloop }

r = TkcRectangle.new(cv, 50, 50, 100, 100, 'outline'=>'blue')
re = TkcRectangle.new(cv, 120, 170, 60, 230,
                      'fill'=>'green', 'outline'=>'orange')
a = TkcArc.new(cv, 50, 50, 100, 100,
               "start"=>0, "extent"=>60, "fill"=>"pink")
a.configure('extent'=>120)
a.coords(50, 25, 100, 75)
a.move(0, 25)
a.style = 'chord'
a.style = 'arc'
a.style = 'pieslice'

require 'open-uri'
require 'tkextlib/tkimg/png'
url = 'http://www.yatex.org/lect/ruby/star.png'
star = TkPhotoImage.new('data'=>
	Tk.BinaryString(open(url){|s| s.read}))
img=TkcImage.new(cv, 100, 50, 'image'=>star)
img.delete
img=TkcImage.new(cv, 100, 50, 'image'=>star, 'anchor'=>'nw')
require 'tkextlib/tkimg/jpeg'
url2='http://www.yatex.org/lect/ruby/shell.jpg'
kame = TkPhotoImage.new('data' =>
	Tk.BinaryString(open(url2){|s| s.read}))
img.image = kame
img.image = star
l = TkcLine.new(cv, 111, 80, 212, 80,
                121, 145, 162, 52, 191, 142,
                111, 80, 'fill'=>'red', 'width'=>3)
ya = TkcLine.new(cv, 120, 200, 300, 200,
	 'arrow'=>'first', 'width'=>3)
ya.arrow = 'last'
ya['arrow'] = 'both'
po = TkcPolygon.new(cv, 30, 30, 30, 160, 250, 150, 220, 35,
                    'fill'=>'cyan')
po.smooth = true
po.splinesteps = 2
po.splinesteps = 12
po.lower
img.raise
l.raise
cx, cy, r = 300, 200, 30
ov = TkcOval.new(cv, cx-r, cy-r, cx+r, cy+r, 'fill'=>'navy')
txt = TkcText.new(cv, 300, 120) {
  text 'ぐるぐる'
  fill 'darkgreen'
  font 'times 20'
}
def guru(x, y, r, ya, ov)
  theta = 2*Math::PI*Time.now.to_f
  vx = x + r*Math.cos(theta)
  vy = y + r*Math.sin(theta)
  ya.coords(120, 200, vx, vy)
  ov.coords(vx-r, vy-r, vx+r, vy+r)
end

job = TkAfter.new(50, 100, proc {guru(cx, cy, r, ya, ov)})
job.start
grp = TkcTag.new(cv)
l.tags = grp
img.tags = grp

grp.move(100, 50)
grp.move(-100, -50)
grp.state = 'hidden'
grp.state = 'normal'
box = TkcRectangle.new(cv, grp.bbox, 'dash'=>'.')
