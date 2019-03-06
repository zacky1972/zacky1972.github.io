---
title: コンピュータシステム CPUロールプレイングワークショップ
layout: post
excerpt: このテキストでは，Z80 CPUになりきってグループワークしながらコンピュータの動作原理を学びます。
---
# コンピュータシステム CPUロールプレイングワークショップ

このテキストでは，Z80 CPUになりきってグループワークしながらコンピュータの動作原理を学びます。

## 準備

下記の動画「ワークショップの手引き」に沿って学習を進めてください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/MiEb4pwBfLk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

必要な資料は下記の通りです。ダウンロードして印刷してご利用ください。

* [Z80CPUレジスタセット(A3で印刷すると良いです)](./pdfs/Z80-registerset.pdf)
* [Z80命令説明書(©︎(有)中日電工)](./pdfs/nd3_z80meirei.pdf)
* [Z80プログラム例1](./pdfs/ComputerSystem-03-CPU-IS-Z80-Q-1.pdf)
* [Z80プログラム例2](./pdfs/ComputerSystem-03-CPU-IS-Z80-Q-2.pdf)

もし用語でわからないことがあったら，次の記事を読んでください。

[「コンピュータの基本構成と動作原理〜知識編」](https://qiita.com/zacky1972/items/ef4486e8a6d95edb68fd)

プログラム例1,2の解答例は次の通りです。

* [Z80プログラム例1-解答例](./pdfs/ComputerSystem-03-CPU-IS-Z80-Q-1-a.pdf)
* [Z80プログラム例2-解答例](./pdfs/ComputerSystem-03-CPU-IS-Z80-Q-2-a.pdf)

このロールプレイングワークショップのノリはこんな感じです(実際には仮装しません)。

<iframe width="560" height="315" src="https://www.youtube.com/embed/KaIxBIclGUQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

準備ができたら問題に進みましょう！	

## ループ

次の問題を解きましょう。

* [Z80プログラム例3](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-3-Loop.pdf)

このプログラムにはループ(繰り返し)があるのが特徴です。解けたら，このプログラムは全体としてどんな数式を計算するプログラムなのかを考えましょう。

解答例は次の通りです。

* [Z80プログラム例3-解答例](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-3-Loop-a.pdf)

類題は次の通りです。

* [Z80プログラム例4](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-4-Loop.pdf)

この類題には解答がありませんので，自力で解いてください。解けたら，このプログラムは全体としてどんな数式を計算するプログラムなのかを考えましょう。

## サブルーチン

次の問題を解きましょう。先に答えをいうと，このプログラムは，サブルーチンの呼出し(CALL)復帰(RET)をします。

* [Z80プログラム例5](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-5-Subroutine.pdf)

スタックとプログラムカウンタの動きに注目してください。とてもトリッキーな動きをするので面食らうかもしれません。

解答例は次の通りです。

* [Z80プログラム例5-解答例](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-5-Subroutine-a.pdf)

類題は次の通りです。

* [Z80プログラム例6](./pdfs/ComputerSystem-04-CPU-IS-Z80-Q-6-Loop-Subroutine.pdf)

この類題には解答がありませんので，自力で解いてください。

ここまでできたら，次のレポート課題に挑戦してみてください。

> サブルーチンの呼出し(CALL)と復帰(RET)でどのようにプログラムカウンタ(PC)とスタックおよびスタックポインタ(SP)をどのように操作するでしょうか。また，どうしてそれによってサブルーチンの呼出しと復帰が実現できるのでしょうか。図や具体例を示しながら説明してください。

