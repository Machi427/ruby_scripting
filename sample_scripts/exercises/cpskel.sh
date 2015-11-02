#!/bin/sh
while IFS=: read name ast uid gid gecos homedir shell; do
  if [ $uid -ge 10000 -a $uid -lt 60000 ]; then
    test -d $homedir && \
      cp -r /etc/skel/. $homedir && \
      chown -R ${uid}:${gid} $homedir
  fi
done < /etc/passwd
