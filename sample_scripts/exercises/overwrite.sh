#!/bin/sh
# OverWrite to file(s) after passing each contents to filter $1
#
if [ x"$1" = x"" ]; then
  cat 1>&2 <<EOF
$0	-	Overwrite wrapper for any filters
Usage: $0 "AnyFilterCommandLine" File(s)

This script WOULD NOT make backup files.
USE WITH CARE or some version control system that can
easily recover lost files.
EOF
  exit 0
fi

cmd=$1; shift
for f; do
  echo "%! $cmd
w
q" | ex $f
done
