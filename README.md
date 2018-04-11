# Cheatsheets

## Markdown Files

Cheatsheets are written in markdown.
See `cheatsheets/template.md` for an example.

<!-- TODO serve PDF and links at github.io 
| | |
|

-->

## Render a file

Use `render.sh`.

```
./render.sh file.md pdf
./render.sh file.md tex
./render.sh file.md native  # useful for debugging pandoc filters
```

## LaTeX Files

With these configuration files, Pandoc renders markdown files into two-column
cheatsheets where every section is drawn in a colored box.

| | |
|------------------|--------------------------------------------------------------------|
| `header.yaml`    | sets most LaTeX options |
| `section2box.py` | converts `\section{X}` into `\begin{tcolorbox}[title=\section{X}]` |
| `template.latex` | fancyhdr, surround document in `multicols` and `tcolorbox` environments |
