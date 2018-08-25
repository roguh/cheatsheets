#!/usr/bin/env python

"""
Pandoc filter to convert all level 1 headers into latex environments.
emphasized text.
"""

from pandocfilters import walk, toJSONFilter, stringify, RawBlock

template1 = """\\end{tcolorbox}\n\\section{%s}\n\\begin{tcolorbox}"""
template2 = """\\end{tcolorbox}\n\\begin{tcolorbox}[title=\\protect\\subsection{%s}]"""

def header2box(key, value, format, meta):
    if format not in ["latex", "pdf", "native"]:
        return
        
    if key == 'Header' and value[0] == 1:
        return RawBlock('latex', template1 % stringify(value))

    if key == 'Header' and value[0] == 2:
        return RawBlock('latex', template2 % stringify(value))

if __name__ == "__main__":
    toJSONFilter(header2box)
