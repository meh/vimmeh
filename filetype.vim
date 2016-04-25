autocmd FileType lisp,ruby,yaml,javascript,haml,scss IndentationLocal 2
autocmd FileType haskell IndentationLocal 4
autocmd FileType markdown,man,git,gitcommit,diff,mail,objdasm,pdf,help,vimshell,rfc,vinarise-dump-objdump setlocal nolist nonu expandtab
autocmd FileType haml,scss setlocal noexpandtab
autocmd FileType haskell,lisp,markdown,erlang,tex,python,cabal setlocal expandtab
autocmd FileType git,gitcommit,gitrebase setlocal expandtab
autocmd FileType cpp set syntax=cpp11

autocmd FileType int-ghci setlocal syntax=haskell
autocmd FileType int-ripl,int-irb,int-rbx setlocal syntax=ruby
autocmd FileType int-python setlocal syntax=python
autocmd FileType int-clj setlocal syntax=clojure
autocmd FileType int-node setlocal syntax=javascript
autocmd FileType int-erl setlocal syntax=erlang
autocmd FileType int-lein setlocal syntax=clojure

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

augroup filetypedetect
	autocmd BufRead,BufNewFile *.rbuild setlocal ft=ruby
	autocmd BufRead,BufNewFile *.markdown setlocal ft=markdown
	autocmd BufRead,BufNewFile *.yml setlocal ft=yaml
	autocmd BufRead,BufNewFile *.asciidoc setlocal ft=asciidoc
	autocmd BufRead,BufNewFile *.asd,*.cic setlocal ft=lisp
	autocmd BufRead,BufNewFile *.json setlocal ft=json
	autocmd BufRead,BufNewFile valgrind*.log setlocal ft=valgrind
	autocmd BufRead,BufNewFile *rfc*.txt setlocal ft=rfc
	autocmd BufRead,BufNewFile *.tpp setlocal ft=cpp syntax=cpp11
	autocmd BufRead,BufNewFile Jamroot setlocal ft=jam
	autocmd BufRead,BufNewFile *.yrl setlocal ft=erlang
	autocmd BufRead,BufNewFile *.xrl setlocal ft=erlang
	autocmd BufRead,BufNewFile *.reds,*.red,*.r setlocal ft=rebol
	autocmd BufRead,BufNewFile *.jad setlocal ft=java
	autocmd BufRead,BufNewFile *.pro setlocal ft=proguard
augroup END

autocmd BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
autocmd BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -
