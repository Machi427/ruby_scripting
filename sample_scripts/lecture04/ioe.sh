#!/bin/sh

echo -n "������ʬ?: " 1>&2
read n
if [ "$n" -le 0 ]; then		# �����ʳ�������ȥ����롣�ץ��顼�����å���
  echo "̵���ʻ���Ǥ���1�ʾ�ο�����ꤷ�Ƥ���������" 1>&2
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
