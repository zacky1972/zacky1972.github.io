---
title: ディジタルシステム設計
layout: default
---
# ディジタルシステム設計 / Digital System Design

## 授業の概要 / Course Description

ディジタルシステム，コンピュータシステムを支えるプロセッサとコンパイラを開発をします。

プロセッサの開発では，RISC型のプロセッサ(CPU)をハードウェア記述言語VHDLで設計して，PCシミュレーターやFPGAを用いて動作確認します。

コンパイラの開発では，IA-32(Intel アーキテクチャのCPU: 80386や Pentium, Core iシリーズなど)上で動作するC言語のサブセットのコンパイラを JavaCC を用いて設計・プログラミングして，PC上で動作確認します。

学生は授業開始前に事前学習資料を読み，プロセッサとコンパイラのどちらから先に開発するかを選択し申告します。

## 教科書 / Textbooks

【プロセッサ開発】
[井澤裕司，シンプルなCPUを作ってみよう，ver.2, 2007. http://www7b.biglobe.ne.jp/~yizawa/design_cpu/index.html](http://www7b.biglobe.ne.jp/~yizawa/design_cpu/index.html)

【コンパイラ開発】
[青木峰郎，ふつうのコンパイラをつくろう : 言語処理系をつくりながら学ぶコンパイルと実行環境の仕組み，ソフトバンククリエイティブ，2009. ISBN: 9784797337952](//www.amazon.co.jp/gp/product/4797337958/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4797337958&linkCode=as2&tag=zacky1972-22)

[![ふつうのコンパイラをつくろう](//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=4797337958&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=zacky1972-22)](//www.amazon.co.jp/gp/product/4797337958/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4797337958&linkCode=as2&tag=zacky1972-22)

## 参考書(図書館蔵書には○) / References (Available in the library: ○)

【プロセッサ開発】
[○ D. A. Patterson and J. L. Hennessy, 成田光彰訳, コンピュータの構成と設計(上下巻)，第5版，日経BP社，2014. ISBN: 9784822298425(上巻)，](//www.amazon.co.jp/gp/product/4822298426/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4822298426&linkCode=as2&tag=zacky1972-22)[9784822298432(下巻)](//www.amazon.co.jp/gp/product/4822298434/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4822298434&linkCode=as2&tag=zacky1972-22)

[![コンピュータの構成と設計(上巻)](//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=4822298426&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=zacky1972-22)](//www.amazon.co.jp/gp/product/4822298426/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4822298426&linkCode=as2&tag=zacky1972-22) [![コンピュータの構成と設計(下巻)](//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=4822298434&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=zacky1972-22)](//www.amazon.co.jp/gp/product/4822298434/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4822298434&linkCode=as2&tag=zacky1972-22) 

【コンパイラ開発】

[○プログラミング言語処理系 佐々政孝著 岩波書店 (絶版)](//www.amazon.co.jp/gp/product/4000103458/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4000103458&linkCode=as2&tag=zacky1972-22)

[![プログラミング言語処理系](//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=4000103458&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=zacky1972-22)](//www.amazon.co.jp/gp/product/4000103458/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4000103458&linkCode=as2&tag=zacky1972-22)

[○コンパイラ : 原理・技法・ツール A.V. エイホ [ほか]共著 サイエンス社 ISBN:9784781912295 (新版あり，新版は図書館蔵書ではない)](//www.amazon.co.jp/gp/product/478191229X/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=478191229X&linkCode=as2&tag=zacky1972-22)

[○コンパイラの構成と最適化 中田育男著 朝倉書店 ISBN:4254121393 (新版あり，新版は図書館蔵書ではない)](//www.amazon.co.jp/gp/product/4254121776/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4254121776&linkCode=as2&tag=zacky1972-22)

## 授業計画・内容 / Class schedules and Contents

【事前学習】

1. オリエンテーション
2. プロセッサとコンパイラの概要

学生はプロセッサとコンパイラのどちらから先に開発するかを選択します。下記で大まかな学習内容を示しますが，学生が個別に演習を進めるので，実際の授業回とは一致しません。また，それぞれの項目の分量も様々です。

【プロセッサ開発】

1. CPUシミュレータの制作
2. VHDLを用いた全体設計
3. VHDLを用いたコンポーネント設計
4. より実用的なCPUを目指して
5. パイプライン処理の導入
6. C言語によるクロスアセンブラの製作

【コンパイラ開発】

1. コンパイラ作りの概要
2. 対象言語とコンパイラの構成
3. 字句解析と構文解析
4. アクションと抽象構文木
5. 意味解析
6. コード生成と最適化
7. リンクとロード

【まとめ】

1. 発表・共有
2. ふりかえり

## 成績評価の方法 / Assessment Method

* 演習課題 70% (授業時間中で出来た範囲の成果物で評価します)
* まとめの成果物(プレゼンテーション，レポート) 30%

## 履修上の注意 / Remarks

履修申告の後，事前学習資料とスケジュールを配布する予定です。事前学習資料ではプロセッサとコンパイラの概要と必要な前提知識，使用する教科書について教授します。事前学習資料を読んでプロセッサとコンパイラのどちらを優先して習得するかを選び，選択結果を授業担当者に申告してください。

本授業では論理回路，コンピュータシステム，コンピュータアーキテクチャの基礎学習事項を修得していることを前提にします。これらの科目を履修していなくても本授業を履修できますが，事前学習資料と，本授業と各科目の教科書・参考書等を元に事前に学習しておいてください。

本授業では Java によるプログラミング演習を行います。ソフトウェア設計・同演習等で UML の記法やオブジェクト指向プログラミングに慣れておくと，本授業で習得しやすいです。

集積回路設計や大学院のVLSI系科目は本授業の内容と関連があります。これらの科目の履修を予定している場合は，本授業を履修すると理解が深まるでしょう。

## 担当者からのメッセージ / Message from the Instructor

ディジタルシステム，コンピュータシステムのしくみや原理について探求したい，設計・プログラミングが好きな学生には興味深い内容だと思います。逆に言うと，そうでない学生はおそらく全くついてこれない授業だとも言えます。履修するかどうか悩んでいる人には相談にのりますので，気軽に連絡ください。

## キーワード / Keywords

ディジタルシステム(digital system)，コンピュータシステム(computer system)，コンピュータアーキテクチャ(computer architecture)，プログラミング言語処理系 (programming language processor)，コンパイラ(compiler)

