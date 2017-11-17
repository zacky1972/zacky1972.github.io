---
title: オブジェクト指向プログラミング〜Template Method パターン
layout: post
excerpt: このテキストでは，Template Method パターンについて説明します。
---
# オブジェクト指向プログラミング〜Template Method パターン

このテキストでは，Template Method パターンについて説明します。

## 動機〜ペットの例

ネコ型ロボットとイヌ型ロボットで「食べる」時の動作の振る舞いが次のように異なるとします。

* ネコ型ロボット
	1. エサのにおいを嗅ぐ
	2. エサを口に入れる
	3. エサに砂をかける動作をする
	4. 毛づくろいする
* イヌ型ロボット
	1. エサのにおいを嗅ぐ
	2. エサを口に入れる
	3. 穴を掘る
	4. エサを埋める

1〜2がネコとイヌで共通している点に注目してください。今までのポリモーフィズムの例では，「食べる」動作の全体をサブクラスで定義するので，共通する1〜2がサブクラスに重複して書かれてしまいます。これではいかにも冗長です。

共通するコードは1箇所にまとめたいですね。

## Template Method パターンによる解法

![Template Method パターン(ペット型ロボット)](assets/images/pet-uml-template-method.png)

プログラムコード例
* [C++](/e-learning/OOPtemplatemethodCPP.html)
* [Python](/e-learning/OOPtemplatemethodPython.html)

