#!/usr/koeki/bin/ruby
# -*- coding: utf-8 -*-
require 'tk'
require 'tkextlib/tkimg/jpeg'
require 'tkextlib/tkimg/png'
require 'open-uri'

class Jump
  def initialize(width = 600, height = 400)
    dir='http://www.yatex.org/lect/ruby/'
    imgsrc = {'data'=>Tk.BinaryString(open(dir+'star.png'){|s| s.read})}
    @star = TkPhotoImage.new(imgsrc)
    imgsrc['data'] = Tk.BinaryString(open(dir+'shell.png'){|s| s.read})
    @kame = TkPhotoImage.new(imgsrc)
    imgsrc['data'] = Tk.BinaryString(open(dir+'shell2.png'){|s| s.read})
    @kame2 = TkPhotoImage.new(imgsrc)
    imgsrc['data'] = Tk.BinaryString(open(dir+'shell3.png'){|s| s.read})
    @kame3 = TkPhotoImage.new(imgsrc)
    @manimg = [@kame, @kame2, @kame3]
    @getstar = nil
    @st_x, @st_y = 400, 220
    @job = nil
    f = TkFrame.new()
    @bt0 = TkButton.new(f, "text"=>"Start(TkAfter)").pack('side'=>'left')
    @bt1 = TkButton.new(f, "text"=>"Start(sleep)").pack('side'=>'left')
    @bt2 = TkButton.new(f, "text"=>"QUIT",
                        'command'=>"exit").pack('side'=>'left')
    f.pack
    # TkFrame.new {|f|
    #   @bt0 = TkButton.new(f, "text"=>"Start(TkAfter)").pack('side'=>'left')
    #   @bt1 = TkButton.new(f, "text"=>"Start(sleep)").pack('side'=>'left')
    #   @bt2 = TkButton.new(f, "text"=>"QUIT",
    #                      'command'=>"exit").pack('side'=>'left')
    # } のようにしたいところだが
    # newに渡すブロックは、TkFrameの initialize() スコープで
    # 実行されるので@bt0 などのこのクラスのクラス変数の初期化は
    # 行なえない。
    @stage = TkCanvas.new('width'=>width, 'height'=>height) {
      bind('1', proc{|x, y| printf("(%d,%d)\n", x, y)}, "%x %y")
    }.pack 
    @i_x, @i_y = 20, height-20
    @g_x, @g_y = width-@kame.width/2, @i_y
    @tgt = TkcImage.new(@stage, @st_x, @st_y, 'image'=>@star)
    @man = TkcImage.new(@stage, @i_x, @i_y, 'image'=>@manimg[0])
    @unit_x, @unit_y = 10, 20
    @jmax = 6; @jnow = 0
    @wait = 20 #msec
    @tx = TkcText.new(@stage, 10, 10,
                      "anchor"=>:nw, "text"=>"Start",
                      "font"=>"Times 24")
    @tx.bind('1', proc{reset(); @move.start()})
    TkRoot.bind('space', proc{jump()})
    TkRoot.bind('q', proc{exit()})
    # TkAfterとsleep，それぞれでアニメーションを行なう
    @move = TkAfter.new(@wait, -1, proc {mv()})
    TkRoot.bind('x', proc{reset(); @move.start})
    @bt0.command = proc {reset(); @move.start}
    @bt1.command = proc {reset(); mvBySleep()}
  end
  def jump()
    @jnow = @jmax
  end
  def reset()
    @getstar = nil
    @tx.text = "Jump!"
    @x = @i_x
  end
  def mv()
    if @x < @g_x                # 右端に着く前は描画処理
      @y = @g_y - ((@jmax-@jnow)*@jnow/2)*@unit_y
      @man.coords(@x, @y)
      step = (@x-@i_x)/@unit_x/6%3
      @man.image = @manimg[step]
      if @stage.find('overlapping', *@man.bbox)[0] == @tgt
        @getstar = true
      end
      @x += @unit_x
      if @jnow > 0 then
        @jnow -= 1              # ジャンプ中の処理
      end
    else                        # 右端に着いたら終了
      @move.stop
      @tx.text = "You " + (@getstar ? "WIN!" : "Lose...")
    end
  end
  def mvBySleep()
    @x = @i_x
    while @x < @g_x
      @y = @g_y - ((@jmax-@jnow)*@jnow/2)*@unit_y
      @man.coords(@x, @y)
      step = (@x-@i_x)/@unit_x/6%3
      @man.image = @manimg[step]
      if @stage.find('overlapping', *@man.bbox)[0] == @tgt
        @getstar = true
      end
      @x += @unit_x
      @jnow -= 1 if @jnow > 0
      @stage.update		# canvasをupdateしないと画面に出ない!!
      sleep(@wait/1000.0)
    end
    @tx.text = "You " + (@getstar ? "WIN!" : "Lose...")
  end
end
k = Jump.new
Tk.mainloop
