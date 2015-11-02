#!/bin/sh

echo -n "何ヶ月分?: " 1>&2
read n
if [ "$n" -le 0 ]; then		# 数字以外があるとコケる。要エラーチェック。
  echo "無効な指定です。1以上の数を指定してください。" 1>&2
  exit 1
fi
m=`date +%m`
y=`date +%Y`
while [ "$n" -gt 0 ]; do
  if [ $m -gt 12 ]; then
    m=1; y=`expr $y + 1`
  fi
  cal $m $y
  m=`expr $m + 1`
  n=`expr $n - 1`
done
