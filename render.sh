input=$1
format=$2
pandoc=./pandoc
common=$pandoc/header.yaml
outdir=out/
output=$outdir/`basename ${input%.md}.$format`
mkdir -p $outdir
pandoc --template $pandoc/template.latex --filter $pandoc/section2colorbox.py --standalone --from markdown+definition_lists $common $input --output $output