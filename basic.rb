#数えながらの繰り返し uptp, downto
1.upto(10) do |x|
  printf("%d, ", x)
end

#数えながらの繰り返し step
s = 0
1.step(99, 2) do |n|
  s +=  n
end
printf("1~99の合計は%dです。 \n", s)
