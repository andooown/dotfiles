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

### Gatekeeper関係でエラーが出るとき
caskでインストールしたアプリでエラーが起きたときは以下のコマンドでGatekeeperを回避すると行けることもある
```
xattr -r -d com.apple.quarantine /Applications/hoge.app
```

### 環境変数
マシンごとの環境変数の設定は`~/.zsh_local_env`を作成し、その中に記述してください。
以下は`~/.zsh_local_env`の例です。
```
export HTTP_PROXY="http://hogehoge:8080"
export HTTPS_PROXY="http://hogehoge:8080"
```
