[![MELPA](https://melpa.org/packages/symbolword-mode-badge.svg)](https://melpa.org/#/symbolword-mode)

# symbolword-mode

Make Emacs' word judgment moderate.

Emacsの単語判定を控えめにします。

Emacsの単語の判定が気に入らないので変更するパッケージです。

`a += 1;`
みたいなコードで、
`+=`の手前にカーソルを置いて、
`M-d`とすると、
`+=`を消したいだけなのに、
`1`まで消えてしまいます。
つまりこうなります。
`a`

かと言って、
`C-d`を使うと面倒です。
なので、
記号部分だけを消すように、
移動コマンドを改造しました。
文字の前で押したら文字部分だけを消します。
つまりこうなります。
`a 1;`

単語移動の判定も同様に気に入らなかったので、
そういう風に変えました。
CamelCaseへの対応は`subword-mode.el`に似た動作をしています。
日本語は適当に処理しています。

# How To

~~~el
(require 'symbolword-mode)
~~~

or

~~~el
(leaf symbolword-mode :ensure t :require t)
~~~
