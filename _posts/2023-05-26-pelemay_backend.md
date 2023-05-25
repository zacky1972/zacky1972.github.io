---
category: blog
tags: 研究構想
title: PelemayBackend(第2版)のコンセプト
layout: post
excerpt: 2023年5月にPelemayBackend(第2版)の開発をスタートしました．そのコンセプトを紹介します．
---
# PelemayBackend(第2版)のコンセプト

2023年5月にPelemayBackend(第2版)の開発をスタートしました．そのコンセプトを紹介します．

## 背景

[PelemayBackendは，2022〜2024年度の研究期間で，北九州産業学術推進機構(FAIS)の旭興産グループ研究支援プログラムの研究開発プロジェクトの支援を受けて研究開発を進めています(https://zacky1972.github.io/blog/2022/03/03/nx-accel.html)．](https://zacky1972.github.io/blog/2022/03/03/nx-accel.html)

そこでは次のような研究目標を掲げていました．

> 産業用コントローラやスマートフォン，Apple Silicon等で広く用いられるARMv8 CPUで行う機械学習や画像処理を並列化・高速化する研究です。並列プログラミング言語Elixir(エリクサー)の機械学習のデファクトスタンダードであるNx(エヌエックス)に対し，私たちの技術シーズであるPelemay(ペレメイ)技術を応用したPelemayバックエンドを研究開発します。
> 
> また，産業用コントローラの用途を踏まえると，ソフトウェアの不具合や脆弱性により異常停止してしまうことを避けたいという要望があります。Elixirの名前は錬金術師が追い求めた不老不死の霊薬の名前に由来し，その名の通り，プログラムが異常終了した時でも再起動してリカバーを図ることがElixirのプログラミング言語の機能として元来備わっています。ただし，より完全を期すためには，ElixirやElixirが母体としているErlang(アーラン)，そしてNxを含むElixir上のアプリケーションにおいて，可能な限り不具合や脆弱性を排除することが求められるのは言うまでもありません。そこで，これらの不具合や脆弱性を可能な限り排除するための体系的な取り組みも併せて行います。

[2023年1月に第64回プログラミング・シンポジウムで，「マルチコアCPUとGPUを含むヘテロジーニアスなコンピュータ・クラスタ上での線形代数学演算の分散並列処理のための中間言語の設計・実装」という口頭発表をしました(https://prosym.org/64/program.html)．](https://prosym.org/64/program.html)

> 線形代数学演算を高速化する研究には，機械学習や画像処理など応用先が広く存在するため大いに社会的意義がある．本研究では，チューリング完全ではない線形代数学演算の有限な長さの列で構成されたソースプログラムを，マルチコアCPUによるコンピュータ・ユニットおよびそれにGPUなどのアクセラレータを備えているようなコンピュータ・ユニットで構成されるヘテロジーニアスなコンピュータ・クラスタで効率よい実行するための中間言語の体系を明らかにし，この方式に基づくJITを並列プログラミング言語Elixirの線形代数学演算基盤であるNxのバックエンドとして実装することを試みた．

Nxバックエンドを含むElixirにおける機械学習領域に関する研究開発の勢いは凄まじく，追いついていくことも難しい状況にあります．最も華々しい成果の1つとしては，[2022年にElixirで画像生成AIであるStable Diffusionを含む生成AIを動作させるBumblebeeが発表されました(https://huggingface.co/blog/elixir-bumblebee)．](https://huggingface.co/blog/elixir-bumblebee)

こうした状況の中で，PelemayBackendのフォーカスすべき領域について，検討を続けてきました．PelemayBackendの支援者の1人であるNerves ProjectのFrank Hunleth氏は，Nervesで扱うIoT・組込みシステム・産業用コントローラで，Nxの主流のアクセラレータであるEXLAを動作させることは，メモリ制約の関係で実用上は厳しいと指摘します．また，IoT・組込みシステム・産業用コントローラにおいて，機械学習の高速化の目的で広く用いられるNVIDIA製のGPUを採用しているのは，NVIDIA Jetsonシリーズのみです．さらに，このようなIoT・組込みシステム・産業用コントローラでは，フォールト・トレランスが強く求められます．現状のNxのエコシステムでは，こうした期待に応えることは難しいと考えられます．

## PelemayBackend(第2版)のコンセプト

[そこで，2023年5月に開発をスタートしたPelemayBackend(第2版)では，次のようなコンセプトを定めました(https://github.com/zeam-vm/pelemay_backend)．](https://github.com/zeam-vm/pelemay_backend)

> PelemayBackend: A memory-saving, fault-tolerant and distributed collection of Nx compilers and backends for embedded systems.
> 
> PelemayBackend: 組込みシステム用の Nx コンパイラとバックエンドの省メモリフォールトトレラント分散型コレクション

ここにもあるように，PelemayBackend(第2版)は，3つの特徴を備えています．

* memory-saving 省メモリ
* fault-tolerant フォールト・トレラント
* distributed 分散

そして，Collection(コレクション)，つまり集合体であると位置付けています．単体で構成された巨大なもの(モノリス)ではなく，シンプルな部品(コンポーネント)を有機的に結合して構成した集合体であるというような意味合いです．

つまり，1つ1つは単機能で小規模であるようなマイクロコントローラを，ネットワークを介して多数結合して構成するというコンセプトを，PelemayBackend(第2版)では追求することにしました．そのような分散システム上に，ソフトウェア部品を展開し，有機的に結合させるネットワークを形成して，機械学習を確実に遂行することの実現を目指します．

## 初手で達成したこと

このようなシステムにするためには，多様なマイクロコントローラ上で動作させることが必要になります．そのため，移植性を追求し，多様な環境で動作することを保証するようなCI(継続的インテグレーション)を構成することを，PelemayBackend(第2版)の第1歩として取り組みました．

[GitHub ActionsでElixirとNervesのクロスプラットフォームCIを組む(https://qiita.com/zacky1972/items/4a7614bff401650fb7d6)](https://qiita.com/zacky1972/items/4a7614bff401650fb7d6)

多様な環境で確実に動作するソフトウェア部品であることを目指そうとしているわけです．

2023年5月現在では，次のような環境をサポートしていきたいと考えています．

> ### Supported Erlang/OTP and Elixir versions:
> 
> Supported Erlang/OTP and Elixir versions:
> 
> * OTP: 24, 25, 26
> * Elixir: 1.14, 1.15
> 
> ### Supported Platforms
> 
> Tested Platforms by CI:
> 
> * Ubuntu 22.04 / 20.04
> * macOS 12 Monterey / 13 Ventura (x86_64)
> * Windows 2022
> 
> Nerves platforms tested only building by CI:
> 
> * rpi4, rpi3a, rpi3, rpi2, rpi0, rpi
> * bbb
> * osd32mp1
> * npi_imx6ull
> * grisp2
> * mangopi_mq_pro
> 
> Other manually tested platforms:
> 
> * macOS 13 Ventura (Apple Silicon)
> * groovEPIC

さらに将来的には，GRiSPやAtomVMにも広げていければ良いなと思っています．

## 謝辞

本研究は北九州産業学術推進機構(FAIS)の旭興産グループ研究支援プログラムの助成を受けたものです．
