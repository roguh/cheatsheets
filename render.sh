input=$1
format=$2
confs=./pandoc
common=$confs/header.yaml

# from=org+yaml_metadata_block
from=markdown+definition_lists
pandoc_opts="--from $from --template $confs/template.latex --filter $confs/subsection2colorbox.py --standalone"

outdir=out/
output=$outdir/`basename ${input%.md}.$format`

mkdir -p $outdir
set -x
pandoc $pandoc_opts $common $input --output $output
