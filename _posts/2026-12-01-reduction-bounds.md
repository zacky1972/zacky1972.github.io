---
category: blog
tags: 研究紹介
title: BEAM言語向けリアルタイム性解析基盤ReductionBounds
layout: post
excerpt: ElixirなどBEAM言語で書かれたプログラムの実行時間を推定する基盤となるオープンソースソフトウェアReductionBoundsについて紹介します。
---
# BEAM言語向けリアルタイム性解析基盤ReductionBounds

ElixirなどBEAM言語で書かれたプログラムの実行時間を推定する基盤となるオ>ープンソースソフトウェアReductionBoundsについて紹介します。

ReductionBounds は、Erlang や Elixir などのBEAM言語のプログラムについて、入力の大きさやデータ構造の状態に応じて、処理に必要な作業量の上限を数式で求めるオープンソースソフトウェアです。
リアルタイム(実時間)システムで、ある処理が CPU を使う順番を与えられた際に、残りの実行時間内で完了できるかを判断するための基盤です。

一度検証した関数の上限を、その関数を呼び出す別の処理の解析に再利用できるのが特徴です。
たとえば、リングバッファへの連続挿入では、負荷の高いリスト反転が何回起きるかを容量と初期状態から求め、全体の作業量の上限を導きます。数式が所定の条件で成り立つことは、証明支援ツール Lean で検証します。

[ReductionBoundsのソースコードをApache 2.0ライセンスで公開しています。](https://github.com/zacky1972/reduction_bounds)

情報処理学会第162回プログラミング研究発表会にて発表する予定です。

