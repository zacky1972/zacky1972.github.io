---
category: tech
tags: 
- Arch Linux
title: Arch Linux を Mac 上の VirtualBox にインストールしてみる 
layout: post
excerpt: Arch Linux をはじめてみました。
---
# Arch Linux を Mac 上の VirtualBox にインストールしてみる

2015年9月24日時点でのインストール

> [Installation steps for Arch Linux guests: VirtualBox (English)](https://wiki.archlinux.org/index.php/VirtualBox#Installation_steps_for_Arch_Linux_guests) 
> [Arch Linux をゲストにする〜VirtualBox(日本語)](https://wiki.archlinuxjp.org/index.php/VirtualBox#Arch_Linux_.E3.82.92.E3.82.B2.E3.82.B9.E3.83.88.E3.81.AB.E3.81.99.E3.82.8B)

1. Arch のインストールメディアをダウンロードする
2. VirtualBox の仮想マシンの仮想ドライブを使って起動する
3. ビギナーズガイドにしたがってインストールする

とあるので，ビギナーズガイドを読みます。

> [Beginner's Guide (English)](https://wiki.archlinux.org/index.php/Beginners%27_guide)
> [ビギナーズガイド (日本語)](https://wiki.archlinuxjp.org/index.php/%E3%83%93%E3%82%AE%E3%83%8A%E3%83%BC%E3%82%BA%E3%82%AC%E3%82%A4%E3%83%89)

1. [ダウンロード](https://www.archlinux.org/download/)ページを開く。Current Release: 2015.09.01 でした。
2. 手近なミラーサイトを開き，archlinux-2015.09.01-dual.iso と  archlinux-2015.09.01-dual.iso.sig をダウンロードする。
3. gpg, md5, sha1 で署名を確認する。
4. VirtualBox を起動する。
5. 適切なメモリとストレージ容量を設定する。とりあえずメモリ1536MB，ストレージは可変で上限8GBを指定。
6. 光学ディスクを archlinux-2015.09.01-dual.iso にする。
7. VirtualBox の Machine > Settings > System の Enable EFI にチェックを入れる。
8. VMを起動する。
9. localeを設定
10. ネットが接続されていることを確認
11. 時計を合わせる

次回はここから

1. パーティションを作る



