# dotfiles

## Usage
以下のコマンドで環境構築ができます。
```
$ bash -c "$(curl -fsSL raw.github.com/andooown/dotfiles/master/dotfiles)" -s init
$ cd $HOME/.dotfiles
$ ./dotfiles deploy
```

また`-f`オプションをつけると上書きをします。
```
$ ./dotfiles -f init
```
