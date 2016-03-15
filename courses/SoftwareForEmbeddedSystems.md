---
title: 組込みソフトウェア
layout: default
---
# 組込みソフトウェア / Software for Embedded Systems

## 関連記事
 
* [多能工プログラマを育成せよ！〜集中講義「組込みソフトウェア」2015をふりかえって](/blog/2015/09/17/embedded-software.html)
* [「ソフトウェア開発の教育のビジョンを語ろう」＠ソフトウェア科学会大会](/blog/2015/09/11/education-vision-JSSST-rePiT.html)

## 授業の概要 / Course Description

本授業では主に簡単な組込みソフトウェアの開発方法を学習します。開発対象のシステムは LED や押しボタンなどがついたシンプルな
マイコンボードです。組込みソフトウェア開発のエッセンスはこのような単純なシステムの開発の中に詰まっています。
この授業でとくに重視しているのが，実開発でも用いられるハードウェアに関する資料を読みながら自律的に問題を解決していくプロセス
です。技術は急速に進化するので知識は陳腐化していく運命にありますが，だからこそ，技術ではなく技術の学び方を学ぶことが強く求められます。
This class introduces how to develop simple embedded software. The target system is a single-board  microcomputer, which has Light Emitting Diodes, pushed buttons and so on. It includes an essencial knowledge of embedded system development.
This class also regards reading reference materials and solving problems autonomously as important because it is strongly needed to learn not only technology but also how to learn technology because a technology is evolved rapidly and becomes obsolescent.

【到達目標 (Course Objectives)】

1. 与えられた関連資料を参照し，指定されたマイコンボードと1〜3種類程度のハードウェア部品からなる組込みシステムに，指定された1〜3機能程度の要求仕様を満たすソフトウェアをペアで設計・実装することによって，問題解決に必要なルールや手順を自ら編み出せる。 
/ Given reference materials, a single-board microcomputer with between one and three types of hardware devices, and requirements specifications of software that have between one and three functions, the student will generate rules and procedures for solving problems to design and implement embedded software satisfying the specification in pairs with instructor support.
2. 組込みシステムの定義を説明できる。 
/ The student will state the definition of an embedded system.
3. Koopman の提唱する組込みシステムの応用領域の分類例について例と説明を考えられる。 
/ The student will generate explanations and examples of the typical application categories of embedded systems, proposed by Koopman. 
4. ISO/IEC9126の品質特性の中から，指定された組込みシステムに最も求められる品質特性がどれか，選択する理由とともに自分の言葉で主張できる。 
/ The student will generate explanations and reasons which quality attribute is the most required of a given embedded system, with his/her own words.

【学位授与方針との関連 (Relationships to the Diploma Policy)】
I. 知識・理解 (knowledge, comprehension)
- 組込みソフトウェアに関連する概念・用語等の基礎知識を自分の言葉で説明できる。(到達目標1-4)
 / The student will state concepts and terminologies related embedded software in his/her own words. (Objective 1-4)

II. 技能 (skills)
- 組込みソフトウェアの開発手法・管理手法に関する技能を身に付ける。(到達目標1) 
/ The student will learn development and management skills of embedded software. (Objective 1)

III. 思考・判断・表現 (thinking, decision making, writing)
- 関連資料を参照しペアで議論しながら問題を自立的に解決できる。(到達目標1) 
/ The student will solve problems by him/herself with reading reference materials and discussing problems in pair. (Objective 1)
- 与えられた製品について，どのような品質が求められるか判断できる。(到達目標4)
 / The student will choose to investigate reference materials by him/herself rather than to ask somebody, if he/she has a question to develop embedded software. (Objective 1)

## 教科書 / Textbooks

講義中に配布します。Textbooks will be distributed by the instructors.

## 参考書(図書館蔵書には○) / References (Available in the library: ○)

[○ B.P. Douglass “Design Patterns for Embedded Systems in C: An Embedded Software Engineering Toolkit”. Newnes, 2010. ISBN 978-1856177078](//www.amazon.co.jp/gp/product/1856177076/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=1856177076&linkCode=as2&tag=zacky1972-22)

[![Design Patterns for Embedded Systems in C](//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1856177076&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=zacky1972-22)](//www.amazon.co.jp/gp/product/1856177076/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=1856177076&linkCode=as2&tag=zacky1972-22)

## 授業計画・内容 / Class schedules and Contents

以下の授業計画は授業改善のため変更される可能性があります。第1回のオリエンテーションでのアナウンスに注意してください。

We plan to change the class schedules and will announce them at the orientation.

1. オリエンテーション，導入 / Orientation, Introduction
2. 組込みシステムのモデリング / Modeling for an Embedded System (Lecture / Exercises)
3. マイコンボードと基本電子回路の学習，開発環境の構築 / Lecture on a Single-Board Microcomputer and Basic Electronic Circuit, Building Development Environment
4. 簡単なプログラミング(1) 出力デバイスの基本: LED を灯す / Simple Programming Exercise (1) Basic Output Devices: turn on/off an LED
5. 簡単なプログラミング(2) 入力デバイスの基本: スイッチを読む / Simple Programming Exercise (2) Bsasic Input Devices: read a switch
6. 設計演習 (1) 機能，構造，ふるまいの設計 / Design Exercise (1) Function Structure and Behavior
7. タイマーと割り込み / Timer and Interruption
8. 設計演習 (2) ソフトウェア部品の考え方と実装のしかた / Design Exercise (2) Software Components
9. 開発演習 (1) ソフトウェア部品を作る / Development Exercise (1) Software Component Development
10. 開発演習 (2) 部品を組み合わせる / Development Exercise (2) Compose Software Components
11. 応用演習〜デバイス調査 / Advanced Exercises: Research on other devices
12. 応用演習〜要求定義演習 / Advanced Exercises: Requirements definition
13. 応用演習〜設計演習 / Advanced Exercises: Design
14. 応用演習〜開発演習 / Advanced Exercises: Development
15. まとめとふりかえり / Summary and Reflection

## 成績評価の方法 / Assessment Method

* 到達目標1: 演習課題 (Exercise): 50%
* 到達目標2: 試験 (Examination): 5%
* 到達目標3: 試験 (Examination): 5%
* 到達目標4: 試験 (Examination): 5%
* 積極的な授業への参加 (Class Participation): 35%

## 履修上の注意 / Remarks

授業では UML によるモデリングとC言語によるプログラミングの能力が必要です。 UML モデリングと C言語プログラミングをよく復習しておいてください。授業では UML によるモデリング能力については学部3年生のソフトウェア設計・同演習を，C言語プログラミング能力については学部1年生の計算機演習Iを受講していることが望ましいです。これらの科目を受講していない場合には，授業開始前に補修を行うので，担当教員に連絡してください。

This class requires skills of modeling in UML and programming in the C language. The student is expected to have taken a course in modeling in UML (Software Design and Exercises for undergraduates) and programming in the C language (Programming Laboratory I for undergraduates). Contact the instructor if the student has not taken these courses, to take supplementary lessons before starting this course.

## 担当者からのメッセージ / Message from the Instructor

この授業では特別講師として組込みシステム開発経験が豊富な技術者を招聘しています。特別講師を通して，実社会で組込みシステムを開発するとはどういうことなのかを学んでいきましょう。

This class invites a special lecturer, who is a professional engineer and has much experience on embedded system development. Let’s learn how embedded software is developed through him!

## キーワード / Keywords

組込みシステム，組込みソフトウェア，ソフトウェア・モデル，品質，設計，実装，プログラミング，UML

embedded system, embedded software, software modeling, software quality, software design, software implementation, programming, UML

