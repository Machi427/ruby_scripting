#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
title = ""
while title <= ""
  STDERR.print "タイトルは?: "
  title = gets.chomp
  if title > "" then
    printf("<html>
<head><title>%s</title></head>
<body>
<h1>%s</h1>
<p>見本文書です。</p>
</body>
</html>\n", title, title)
  end
end
