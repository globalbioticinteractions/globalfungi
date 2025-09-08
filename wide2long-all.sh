#!/bin/bash
#
# rotates Global Fungi tables from wide tables to long tables 
# see https://github.com/globalbioticinteractions/globalbioticinteractions/issues/1098
#

set -x

rotate_tables() {
  local filenameroot=GlobalFungi_5_${1}_abundance
  bash wide2long.sh ${filenameroot}_ITS1_ITS2.txt.gz 1>${filenameroot}_ITS1_ITS2.long.txt 2>${filenameroot}_ITS1_ITS2.long.log
  bash wide2long.sh ${filenameroot}_ITS1.txt.gz 1>${filenameroot}_ITS1.long.txt 2>${filenameroot}_ITS1.long.log
  bash wide2long.sh ${filenameroot}_ITS2.txt.gz 1>${filenameroot}_ITS2.long.txt 2>${filenameroot}_ITS2.long.log
}

rotate_tables species
rotate_tables genus
rotate_tables SH
