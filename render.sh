#!/bin/sh
input=$1
format=${2:-pdf}
confs=./pandoc
name=$(basename ${input%.*}.$format)
outdir=out
output=$outdir/$name
common=$confs/header.yaml

if [ "$#" -lt 1 ]; then
  echo USAGE: $0 filename.{org,md} [output_format_ext=pdf]
  exit 1
fi

echo $input
case ${input##*.} in
    org) 
        set -x
        pandoc $input --output $output.md
        set +x
        input=$output.md
        ;;
esac

from="--from markdown+definition_lists"
pandoc_opts="$from --template $confs/template.latex --filter $confs/subsection2colorbox.py --standalone"


mkdir -p $outdir
set -x
pandoc $pandoc_opts $common $input --output $output
