# dotfiles

## Usage
### Requirement
- Xcode
  - To install `xcodes`

### Setup
Run following commands to setup.
```
$ bash -c "$(curl -fsSL raw.github.com/andooown/dotfiles/master/dotfiles)" -s init
$ cd $HOME/.dotfiles
$ ./dotfiles deploy
```

You can force to overwrite with `-f` option.
```
$ ./dotfiles -f init
```

### Tips
#### ENV for each machines 
If you need the environment variables for each machines, you can use `~/.zsh_local_env` file.

Example
```
export HTTP_PROXY="http://hogehoge:8080"
export HTTPS_PROXY="http://hogehoge:8080"
```

