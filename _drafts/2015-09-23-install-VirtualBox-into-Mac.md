---
category: tech
tags: 
- VirtualBox
- Arch Linux
title: Mac に VirtualBox をインストールする 
layout: post
excerpt: Mac に仮想環境を構築できるようにしてみました。
---
# Mac に VirtualBox をインストールする

いろいろ思うところあって(そのうち書く)，Linux を始めてみようと思った。ディストリビューションは，ものすごく歯ごたえありそうな Arch Linux を選択してみた(この理由もそのうち書く)。

最初は日和見で VirtualBox 上で動かしてみることにする。

VirtualBox は普通にインストールすることもできるが，homebrew-cask を使うとコマンドラインでインストールとメンテナンスができる。

```bash
$ brew cask install virtualbox
```

途中，sudo を実行するためのパスワードを聞かれる。

> メモ: 
> vargrant を使うと仮想環境を管理しやすくなる。
> 今はまだ私のスキル的に時期尚早だが，いずれトライする。

今日はここまで。次回，Arch Linux をインストールしてみます！

