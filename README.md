# symbolword-mode

Make Emacs' word judgment moderate.

Emacsの単語判定を控えめにする.

Emacsの単語の判定が気に入らないので変更するパッケージです.

`a += 1;`
みたいなコードで,+=の手前にCursorをおいて,M-dとすると,+=を消したいだけなのに,1まで消えてしまう.
つまりこうなる.
`a`
かと言って,C-dを使うと面倒です.
なので,記号部分だけを消すように(文字の前で押したら文字部分だけを),移動コマンドを改造しました.
つまりこうなる.
`a 1;`

単語移動の判定も同様に気に入らなかったので,そういう風に変えました.
CamelCaseへの対応はsubword-mode.elに似た動作を.
日本語は適当に処理しています.

# How To

~~~el
(require 'symbolword-mode)
~~~
