#!/bin/sh
while IFS=: read gname ast gid users; do
  echo "$gname = $users"
done < /etc/group
