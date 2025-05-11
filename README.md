## Linux

<div align="center">
  
  ![my-rice](https://i.imgur.com/Mvonruz.png)
  ![overalls](https://i.imgur.com/q7GCQFC.png)
  
</div>

## Windows (Arch on WSL)

<div align="center">
  
  ![my-rice](https://i.imgur.com/hzaBGk0.jpeg)
  ![overalls](https://i.imgur.com/fGIvcfX.png)
  ## 「見果ひうらのライスセットアップ！」♡
  
</div>

<br>

### Currently Tracked Dotfiles:
  - konsole
  - neofetch
  - [Kvantum](https://github.com/tsujan/Kvantum/tree/master/Kvantum)
  - bash, uses [synth-shell](https://github.com/andresgongora/synth-shell) therefore is **required**
  - wezterm
<p>Some dotfiles aren't added yet, will add very soon!</p>

### Window Manager:
Linux: **Kwin** (KDE Plasma)

Windows: **[GlazeWM](https://github.com/glzr-io/glazewm)**

<hr>

### Installation
Clone the repo into your prefered directory (**my script only works for unix systems and its outdated, might use [stow](https://www.gnu.org/software/stow/manual/stow.html) soon**)
```gnu
git clone https://github.com/Koipix/cutie-dotfiles.git
cd cutie-dotfiles/script
chmod +x ./mklink.sh ./mkrestore.sh ./mkupload.sh
```

### Apply Config
This applies the config from the repo while backing up yours to restore later on
```
./mklink.sh
```

### Restore Config
If you want to restore to your own config setup (assuming you ran `./mklink.sh` first)
```
./mkrestore.sh
```

### Upload Config
If you want to upload your own confiig changes to the repo (experimental)
```
./mkupload.sh
```

<br>

<p>PS: <b>This is a experimental personal project of mine</b>—this might not work on your system or even bweak it but give it a try as long as you know what you're doing ^-^ feel free to review the shell scripts ♡</p>

<br>

<p><b>I'm new to shell scripting but I tried my best to make it functional, can't blame me... -w-</b></p>

<br>

PS: これは私の実験的なプロジェクトです。お使いのシステムで動作しないか、場合によっては壊れる可能性がありますが、必要な依存関係とパッケージが揃っていれば試してみてください。シェルスクリプトのレビューも歓迎です♡

シェルスクリプトは初心者ですが、一生懸命作りました。だから文句は言わないでね… -w-
