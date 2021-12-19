# dotfiles

## Requirement
- Xcode
  - To install `xcodes`

## Setup
### dotfiles
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

### iTerm2
Load config file in **Preferences > General > Preferences**

![image](https://user-images.githubusercontent.com/19662625/146684859-ef190f3d-04cd-4e52-b62b-69496f8fb4d5.png)

then
- Quit iTerm2
- Run `sudo killall cfprefsd` 
- Start iTerm2

## Tips
### ENV for each machines 
If you need the environment variables for each machines, you can use `~/.zsh_local_env` file.

Example
```
export HTTP_PROXY="http://hogehoge:8080"
export HTTPS_PROXY="http://hogehoge:8080"
```

