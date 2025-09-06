#!/bin/bash
#
# This script translates the wide table
#
# sample_ID species1 species2 ... species20000
# id1 0 1 0 0 ...
# id2 2 0 0 0 ...
#
# provided by globifungi
#
# into a long format
#
# sample_ID species count
# id1 species2 1
# id2 species1 2
#
# where only non-zero counts of sample id <> species pairs are listed.
#

set -x

num_columns=$(cat "$1" | gunzip | head -1 | tr '\t' '\n' | wc -l)
column_range=$(paste <(seq 2 1000 ${num_columns}) <(seq 1001 1000 ${num_columns}) | sed 's/\t/-/g')

echo "${column_range}"\
 | tr ' ' '\n'\
 | xargs -I{} bash -c "cat \"$1\" | gunzip | cut -f1,{} | mlr --tsvlite --records-per-batch 1 reshape -r '[A-Z][a-z].*' -r 'GS.*' -r 'all_.*' -o item,value" | grep -vE "[^0-9]0$"
