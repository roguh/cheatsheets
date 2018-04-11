#!/usr/bin/env python

"""
Pandoc filter to convert all level 1 headers into latex environments.
emphasized text.
"""

from pandocfilters import walk, toJSONFilter, stringify, RawBlock

template = """\\end{tcolorbox}\n\\begin{tcolorbox}[title=\\protect\\section{%s}]"""

def header2box(key, value, format, meta):
    if format not in ["latex", "pdf", "native"]:
        return
        
    if key == 'Header' and value[0] == 1:
        return RawBlock('latex', template % stringify(value))

if __name__ == "__main__":
    toJSONFilter(header2box)
