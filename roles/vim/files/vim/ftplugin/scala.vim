nnoremap ,req :-1read $HOME/.vim/.skeleton/scala/req.scala
nnoremap ,sbt :-1read $HOME/.vim/.skeleton/scala/sbt.scala
nnoremap ,cat :-1read $HOME/.vim/.skeleton/scala/cats.scala

inoremap ,fy for {<Enter><<++>> <- <<++>><Enter>} yield {<Enter><<++>><Enter>}<Esc>4k
inoremap ,gi <<++>> <- <<++>><Esc>0
