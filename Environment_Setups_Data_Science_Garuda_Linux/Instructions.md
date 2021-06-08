# Instructions for the setups of Garuda Linux in Data science


## Uprade the System

* After installation, just reboot and go into Garuda for the first time.
* The assistant will ask to refresh the `mirrorlists` for the downloads of
  related packages.
* Thus, the system will ask whether to upgrade the system, and just press "yes"
  to wait for the upgrade process to complete. During the process, users are
  requeted to input the password to authorize `sudo`. On the other hand, the
  responses to input `y` are also required to put the process forward.
* After the above upgrade process, the system also suggest installing the
  softwares. It is advised to NOT doing this step at this moment and reboot the
  system at first.

## Installation of Brave Browser

* Use `pacman` to install [Brave Browser](https://brave.com/) which focuses on
  privacy:
  ```
  sudo pacman -S brave
  ```
* After installation, just set it as default browser by revising `~/.profile`:
  ```
  export BROWSER=brave
  ```

## Remarks for Chinese Language

* Just inspired by [Garuda Linux on a 2013 15 MBP](https://medium.com/codex/garuda-linux-on-a-2013-15-mbp-df47f162b961)
  I just install the following to avoid weird symbols in Chinese:
  ```
  sudo pacman -S wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts noto-fonts-cjk
  ```
* On the other hand, Chinese input method is also needed to setup, since I just
  chose `American English` as the default language when installing Garuda.
  * First install `ibus` related softwares by
    ```
    sudo pacman -S ibus
    sudo pacman -S ibus-rime
    sudo pacman -S rime-wubi
    ```
  * After the installation, then just put the following at the end of
    `~/.profile`:
    ```
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    ibus-daemon -d -x
    ```
    and then reboot.
  * Now one can find `ibus preferences` in `settings`, and then tries adding
    `rime` input method from `Chinese`.
  * On the other hand, just add the following `default.custom.yaml` file to
    `~/.config/ibus/rime/`:
    ```
    # default.custom.yaml
    # save it to: 
    #   ~/.config/ibus/rime  (linux)
    #   ~/Library/Rime       (macos)
    #   %APPDATA%\Rime       (windows)

    patch:
      schema_list:
        - schema: luna_pinyin          # 朙月拼音
        - schema: luna_pinyin_simp     # 朙月拼音 简化字模式
        - schema: luna_pinyin_tw       # 朙月拼音 臺灣正體模式
        - schema: terra_pinyin         # 地球拼音 dì qiú pīn yīn
        - schema: cangjie5             # 倉頡五代
        - schema: cangjie5_express     # 倉頡 快打模式
        - schema: wubi86               # 五笔86
        - schema: wubi_pinyin          # 五笔拼音混合輸入
    ```
  * Now it is ready to use it! One will find `EN` is shown in the upper right
    position, and now open any brave browser and in the address press
    `win + space` to change to `rime`. Now click the icon of `rime` and then click
    `deploy` and wait for it to complete without errors.
  * Now in the address of brave try pressing __ctrl+`__ several options of input
    methods are available. 

## Homebrew setups

* Since Garuda Linux is the Arch based system which will provide rolling updates
  regularly. It is suggested to run the following before the installation of
  other softwares.
  ```
  sudo pacman -Syu
  ```
  Sometime, the errors about `timeshift` not working may show up to indicate
  errors. The simple workaround is to input
  ```
  sudo SKIP_AUTOSNAP=1 pacman -Syu
  ```
* Install `Homebrew` to manage part of the softwares and apps to replicate the
  similar experience as MacOS. The tricky point is that the instructions about
  `Homebrew` are mainly based on `bash/zsh`, but Garuda Linux use `fish` by
  default. The merits indicated by [Fish vs. Zsh vs. Bash and Why You Should 
  Switch to Fish](https://betterprogramming.pub/fish-vs-zsh-vs-bash-reasons-why-you-need-to-switch-to-fish-4e63a66687eb)
  just let me have a try on fish. However, some minor revisions of the codes
  are needed to comply with the syntax of `fish`.
* Generally speaking, the config file of `fish` is in
  `/home/.config/fish/config.fish`. One can use [micro](https://micro-editor.github.io/),
  the default editor in Garuda Linux to open such config file. It is noticed
  that `source ~/.profile` is in the file, whicn means that this file
  automatically load the setups from `~/.profile`.
* From the home page of [Homebrew](https://brew.sh/), the suggested installation
  command is
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  However, this command is NOT valid in `fish`. The revised code is
  ```
  bash
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  exit
  ```
  raised by [Unable to install Homebrew + fish terminal (Mac)](https://stackoverflow.com/questions/34010513/unable-to-install-homebrew-fish-terminal-mac).
  Just temporarily go into `bash` ti execute the installation command and then
  come back to the `fish`.
* After the installation, the following steps are needed to let `brew`
  initialize everytime openning the `fish`:
  ```
  echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/alfredfaisam/.profile
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  ```
  inspired by https://github.com/Homebrew/brew/issues/10114.
* On the other hand, it seems that `Homebrew` will create temporary files in
  `/tmp` which may return the errors about permission. Therefore, one can add
  the following line in `~/.profile`:
  ```
  echo 'export HOMEBREW_TEMP=/var/tmp' >> /home/alfredfaisam/.profile
  ```
  inspired by https://github.com/Linuxbrew/brew/issues/923.
* Now we can shut off and then reopen the `Konsole`, and then input
  ```
  brew update
  ```
  If the process can complete without errors, then the installation of `Homebrew`
  is successful.
* Other related packages can be installed now to support the functions of
  `Homebrew`:
  ```
  sudo pacman -S base-devel
  ```
  `base-devel` is a package group that includes tools needed for building 
  (compiling and linking). It is also suggested to install the latest version of
  `gcc`:
  ```
  brew install gcc
  ```
  Up until this point, users can just use `Homebrew` as they do in MacOS.

## Installation of Neovim

* Just use `brew` to install `Neovim`:
  ```
  brew install --HEAD luajit
  brew install --HEAD neovim
  ```
* Install `vim-plug`:
  ```
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ```
* Change directory to `~/.config`, just copy my suggested config folder for `Neovim` from https://github.com/AlfredSAM/medium_blogs/tree/main/Neovim_Setups_for_Data_Science/nvim
* In `Konsole`, just input
  ```
  nvim
  ```
  to go to `neovim` for the first time when one may see some errors due to the
  missing plugins. Therefore, one can just input
  ```
  :PlugInstall
  ```
  and then wait for the installation to finish.
* Just use `:q!` to quit and then reopen `nvim`, one can find that the latest
  files for `treesit` will be downloaded and compiled and the information is
  whone at the bottom of the `nvim` window. Just wait for it to complete, and
  now `nvim` is ready to use.

## Miniconda Installation

* In terms of data science, `conda` is the common package to manage environments
  for Python or R.
* Just go to `~/Downloads`, and then download the installation package:
  ```
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  ```
  and then install it
  ```
  bash Miniconda3-latest-Linux-x86_64.sh
  ```
* Please note that at the end of the installation the program will ask whether
  to add `init` commands. However, even input `yes` for this prompt one can
  still find that `conda` is NOT loaded when reopening the `Konsole`. The reason
  is that the `init` commands are only added to the `~/.bashrc`:
  ```
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/alfredfaisam/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/alfredfaisam/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/alfredfaisam/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/alfredfaisam/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
  ```
  However, Garuda Linux use `fish` by default, so the above commands are not
  effective. One can input
  ```
  /(your conda installation path)/bin/conda init fish
  ```
  and then one can find the following lines are added to
  `~/.config/fish/config.fish`:
  ```
  #>>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  eval your/path/to/anaconda3/bin/conda "shell.fish" "hook" $argv | source
  # <<< conda initialize <<<
  ```
  Now reopen the `Konsole` and then input
  ```
  conda update conda
  ```
  one can find the program can run as normal.

## Setup Conda Environments for Python and R

## Installation of Julia

```
mkdir ~/opt
cd ~/opt
wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.1-linux-x86_64.tar.gz
tar -xvf julia-1.6.1-linux-x86_64.tar.gz
```
Run `julia`:
```
~/opt/julia-1.6.1/bin/julia
```
Furthermore, one can add the following to `$PATH`
```
echo 'export PATH="$HOME/opt/julia-1.6.1/bin:$HOME/.local/bin:$PATH"' >> ~/.profile
```
so that only inputting `julia` can run the program.


