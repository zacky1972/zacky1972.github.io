---
category: blog
tags: 告知 多能工プログラマ 自ら学ぶ力を持たせる 現実社会の問題解決の経験を積ませる
title: LED-Camp 3.0 〜コンセプトからの授業改善の報告 ＠SWEST
layout: post
excerpt: 教育を通じて学生や若手の社会人たちにどのような技術者になっていってほしいのか。若き大学教員たちがその問いを考え抜いて，合宿型初級者向け組込みソフトウェア開発教育プログラム LED-Camp をデザインして改善した顛末を報告します。
---
## LED-Camp 3.0 〜コンセプトからの授業改善の報告〜第2部 ＠SWEST

## インストラクショナル・デザイン(ID)とは？

ソフトウェア開発では，プログラミング以外にも，「どんなソフトウェアを作るのか」を定義したり(要求分析)，「どのように実現するか」を検討したり(設計)，「作ったソフトウェアが妥当か」を確かめたり(レビュー，テスト)，様々なことをしますね。教育においても同様に，いきなり授業するのではなく，分析や設計，評価などを行うことが大事だという考え方があります。また，ソフトウェア開発の良し悪しは QCD (品質，コスト，納期)で考えますよね。教育における同様の評価尺度は，**効果・効率・魅力**です。

この分科会で紹介する「**インストラクショナル・デザイン(ID)**」は，学習の効果・効率・魅力を最大限に引き出すために計画的に教育や学習環境を作り上げていくことです。この分科会でインストラクショナル・デザインをどのように導入するか，詳しく紹介します。

## コンセプトづくり

> [ブログ記事より「授業づくりはまずコンセプトづくりから〜事例に学ぶコンセプトづくり」http://zacky1972.github.io/blog/2015/02/25/concept-making-in-practice.html](http://zacky1972.github.io/blog/2015/02/25/concept-making-in-practice.html)

コンセプトがはっきりしている製品やサービスは，そうでない製品やサービスに比べて使い勝手が良いことが多いですよね。同じように授業でもコンセプトをはっきりさせると学生にとって様々な利点が生まれます。

* 授業コンセプトをはっきりさせると　**「何のために学ぶのか」をイメージしやすくなります。** これにより学習内容と学習者の関連性(後述のARCSモデルのR)を見出しやすくなるので，学習意欲を喚起することにつながります。
* 選択科目のコンセプトがはっきりしていると 学生にとって**その科目を選ぶか選ばないかを判断しやすいです。** これによりミスマッチを防ぐことにつながります。
* 授業コンセプトがはっきりしていると，その授業が成功したのか失敗したのかを評価する方針も定まりやすくなります。これにより授業改善の指針も明確になり，より成功しやすくなります。
* 授業コンセプトがはっきりしていると，授業全体に一貫性を持たせやすくなります。一貫した授業は学生の満足度を高めるのに役立ちます。

では授業コンセプトにはどのような構成要素があるのでしょうか。私は次のように捉えています。

1. 授業内容の範囲
2. 教え方の方針やスタイル
3. カリキュラムの中での授業の役割や位置付け
4. どのような学生が対象なのか
5. その学生にどうなってほしいのか
6. 学習手段として何を使うのか

またこれらは互いに関連し合っています。とくにコンセプトに一貫性を持たせるためには，このレベルでもきちんとデザインしておく必要があります。分科会当日には LED-Camp を事例にしてコンセプトづくりを紹介します。

## 学習目標(ガニェの学習成果の5分類)

インストラクショナル・デザイン理論の生みの親の一人，ガニェ(Robert M. Gagne)が提唱した**学習成果の5分類**は，学習目標を次の5つに大別しています。

* 言語情報(verbal information)
* 知的技能(intellectual skills)
* 認知的方略(cognitive strategies)
* 態度(attitudes)
* 運動技能(motor skills)

これらについては次の記事に詳しく紹介されています。

> [第7回：学習目標の立て方～5分類を活用しよう～ https://www.knowledgewing.com/kw/blog/2010/09/201009281628.html](https://www.knowledgewing.com/kw/blog/2010/09/201009281628.html)

次の記事では，ガニェの学習成果の5分類を踏まえて，より高度な「問題解決」について論じました。

> [何ができたら「問題解決」したことになるのか〜ガニェの教えからの考察 http://zacky1972.github.io/blog/2015/02/11/essence-of-problem-solving.html](http://zacky1972.github.io/blog/2015/02/11/essence-of-problem-solving.html)

### 学習意欲(ARCSモデル)

> [ブログ記事より「学習意欲に火をつけよう！ 〜ARCS モデル」http://zacky1972.github.io/blog/2015/02/06/ARCS.html](http://zacky1972.github.io/blog/2015/02/06/ARCS.html)

一口に学習意欲といっても，何が原因で学習意欲を損ねているのかによって，対処方法を変える必要があります。 

ARCS モデルは学習意欲の4つの類型を表すモデルです。 

* **A: 注意 Attention** 目新しいことには学習意欲が湧く
* **R: 関連性 Relevance** 自分の身近なことや将来に関連づけられると学習意欲が湧く
* **C: 自信 Confidence** やってみてできるようになったことは自信がついて学習意欲が湧く
* **S: 満足 Satisfaction** やって満足したことは次もやってみようと思い学習意欲が湧く

ARCS モデルについて学びたい方は，まず次の教材をお試しください。

> [さあ ARCS モデルを学ぼう！](http://www.edutech.tohoku-gakuin.ac.jp/edu/arcs/kyouzai/entrance.html) 


大事なことは，どの点で学習意欲が湧かないのかを見極めることです。やみくもにARCSモデルの4つ全ての学習意欲を高めようとするのはやり過ぎです。それを常態化してしまうと，より強い刺激を受けないと意欲を感じなくなってしまいますからね。 

学習者が ARCS どれを刺激するといいかを見極めるにはアンケートを用いるのが一般的です。

> [アンケートの取り方の参考例〜ARCSモデルに基づく改善方略ガイドブックについて](http://www2.gsis.kumamoto-u.ac.jp/arcsguidebook/) 

## 教育効果の測定(カークパトリックの4段階評価法)

とくに企業での研修の場合，研修の教育効果は，単に「受講者の反応がよかった」というよりも，結果として職場の業績向上に結びつくことの方がより価値があります。カークパトリックは次の4段階に分けて研修を評価するフレームワークを提案しました。

|----:|:--|:------|
|レベル|問い|評価手段|
|1 |研修に満足したか？  |アンケート等|
|2 |能力が身についたか？ |筆記試験やレポート等|
|3 |行動が変化したか？  |周囲へのインタビュー等|
|4 |業績を上げられたか？|経営指標の分析等|
