syn region liquidHighlight     start=/^{%\s*highlight\(\s\+\w\+\)\{0,1}\s*%}$/ end=/{%\s*endhighlight\s*%}/ contains=@Spell
syn region jekyllMetadata   start=/\%^---$/                                 end=/^---$/                  contains=@Spell

hi def link liquidHighlight String
hi def link jekyllMetadata String
