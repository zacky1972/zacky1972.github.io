---
title: オブジェクト指向プログラミング〜変化を抱擁せよ
layout: post
excerpt: このテキストでは，なぜオブジェクト指向プログラミングが必要となったのか，背景を説明します。
---
# オブジェクト指向プログラミング〜変化を抱擁せよ

このテキストでは，なぜオブジェクト指向プログラミングが必要となったのか，背景を説明します。

## ソフトウェアには変化がつきもの

ソフトウェアは，さまざまな要因で変化せざるをえません。

* 毎年のように新しいスマートフォンがリリースされます。その新しいスマートフォンはディスプレイサイズが変化したかもしれません。新しいボタンが追加されたり逆になくなったりしたかもしれません。今までにない新しい機能を提供する部品が追加されたかもしれません。新しいハードウェアでは，今までのソフトウェアがそのまま動作するとは限りません。むしろ，ソフトウェアを変更しないと新しいハードウェアを動かすことができないことの方が多いです。
* ユーザーや社会が求める機能は，移ろいやすいものです。今までのアプリに不満を覚え，もっとこうなったらいいのに！と要求したくなることは多々あります。これらの要望に応えるには，ソフトウェアを変更するしかないでしょう。
* セキュリティの脅威は日々増しています。今までにない攻撃手段が編み出されることでしょう。今まで見つからなかった脆弱性やバグが見つかるかもしれません。そのたびにソフトウェアには変更が必要でしょう。

ソフトウェアには変化がつきものです。したがって，変化に耐えられるような仕組みが必要なのです。

## 変化に対応するためにオブジェクト指向プログラミングが生まれた

変化に耐えられるようなソフトウェアを作りたい。オブジェクト指向プログラミングは，そんな願いから生まれました。

オブジェクト指向プログラミングの原動力の1つであるポリモーフィズムを思い出してみましょう。Client のコードを変更しなくても，サブクラスを差し替えることで，動作を変えることができます。1つのサブクラスの振る舞いを変更しても，スーパークラスや他のサブクラスに影響を与えることは少ないでしょう。ネコ型ロボット，イヌ型ロボットの他に，ネズミ型ロボットという新しいサブクラスを追加することで，新製品を作ることだってできます。

今後，ポリモーフィズムの他にもさまざまな仕組みやテクニックを紹介していきますが，そのどれもが，変化に対応するために編み出されました。

## 演習問題 変化を抱擁せよ

### 演習問題1

ポリモーフィズムの演習問題1,2で，元々のプログラムの振る舞いを変更したり，機能を追加したりしました。これらの変更は，局所的な範囲に収まっていましたか？ グループで議論してみましょう。

### 演習問題2

オブジェクト指向ではないプログラミング言語，たとえばC言語で，ペット型ロボットの例を作成してみましょう。次に，ポリモーフィズムの演習問題1,2のような変更を加えてみてください。これらの変更は，局所的な範囲に収まっていましたか？ グループで議論してみましょう。

### 演習問題3

ポリモーフィズムによって，どのようなタイプの変化に対応できますか？ グループで議論してみましょう。