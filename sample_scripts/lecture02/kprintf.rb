# kanji-aware printf for both Ruby1.8 or 1.9+
class String
  require 'kconv'
  if defined?("".force_encoding)
    def toeucbin()
      self.toeuc.force_encoding("binary")
    end
  else
    def toeucbin()
      self.toeuc
    end
  end
end

class IO
  def printf(*args)
    out = sprintf(*(args.collect{|x| x.is_a?(String) ? x.toeucbin : x }))
    print out.toutf8
  end
end

class Object
  def printf(*args)
    if args[0].is_a?(String)
      $stdout.printf(*args)
    else
      port = args.shift
      port.printf(*args)
    end
  end
end
