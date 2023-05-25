---
category: blog
tags: 論文の書き方
title: どんな人が話を聞くのかを知ることがAbstractとIntroductionを書くのにとても重要
layout: post
excerpt: AとBの2つの分野の境界領域に関する研究を発表するとしたときに，Introductionをどのように書いたらいいでしょうか．
---
# どんな人が話を聞くのかを知ることがAbstractとIntroductionを書くのにとても重要

AとBの2つの分野の境界領域に関する研究を発表するとしたときに，Introductionをどのように書いたらいいでしょうか．

たまたま，今日のゼミで，宇宙とコンピューティングという，2つの分野の境界領域に関する研究なのに，AbstractとIntroductionの書き方のスタンスが真逆であるような，そんな2つの論文をそれぞれ学生が紹介していましたので，それを例に，記事を書いてみたいと思います．

## 今日紹介する研究論文その１

[M. Wielage, F. Cholewa, C. Fahnemann, P. Pirsch and H. Blume, "High Performance and Low Power Architectures: GPU vs. FPGA for Fast Factorized Backprojection," 2017 Fifth International Symposium on Computing and Networking (CANDAR), Aomori, Japan, 2017, pp. 351-357, doi: 10.1109/CANDAR.2017.101.](https://ieeexplore.ieee.org/document/8345456)

> Abstract: The question if new embedded low power Graphic Processing Units (GPUs) can compete with Field Programmable Gate Arrays (FPGAs) in terms of performance and efficiency is addressed. A Virtex 6 and a Virtex Ultrascale+ FPGA are compared to a Jetson TX2 GPU. Instead of basing the comparison on manufacturer reference numbers, hand optimized high performance implementations of the Fast Factorized Backprojection (FFBP) algorithm for Synthetic Aperture Radar (SAR) image generation have been investigated. Performance is measured in image lines per second and efficiency in performance per power. The Virtex Ultrascale+ provides a runtime speed-up of about 6.5x and an efficiency improvement of about 4.3x compared to the Jetson TX2 GPU.

高性能かつ低消費電力のアーキテクチャ: 高速因数分解逆投影における GPU 対 FPGA

第5回コンピューティングとネットワーキングに関する国際シンポジウム

概要: 新しい組込み低消費電力グラフィック・プロセッシング・ユニット(GPU)が，パフォーマンスと効率の点でフィールド・プログラマブル・ゲート・アレイ(FPGA)と競合できるかどうかという問題に取り組む． Virtex 6 および Virtex Ultrascale+ FPGA を Jetson TX2 GPU と比較する．メーカーのカタログに基づく比較の代わりに，合成開口レーダー(SAR)画像生成用の高速因数分解逆投影(FFBP)アルゴリズムを手作業で最適化した高性能実装を調査した．パフォーマンスは1秒あたりの画像ライン数で測定され，効率は電力あたりのパフォーマンスで測定される．Virtex Ultrascale+ は，Jetson TX2 GPU と比較して，ランタイムが約 6.5 倍高速化され，効率が約 4.3 倍向上する．

## 今日紹介する研究論文その2

[T. Yang, Q. Xu, F. Meng and S. Zhang, "Distributed Real-Time Image Processing of Formation Flying SAR Based on Embedded GPUs," in IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing, vol. 15, pp. 6495-6505, 2022, doi: 10.1109/JSTARS.2022.3197199.](https://ieeexplore.ieee.org/document/9852294)

> Formation flying synthetic aperture radar (FF-SAR) systems, as an important development direction of multichannel SAR, can achieve high-resolution wide-swath imaging. Coherently combining data from satellite receivers puts a strain on the traditional real-time processing systems based on individual satellites. Characteristics, such as the power of real-time on-orbit processing platform, must be properly balanced with constrained memory and parallel computational resources. This article proposes a distributed SAR real-time imaging method based on the embedded graphics processing units (GPUs). The parallel computing method of the chirp scaling algorithm is designed based on the parallel programming model of compute unified device architecture, and the optimization methods of memory and performance are proposed for the hardware architecture of embedded GPUs. In particular, the unified memory management method is used to avoid data copying and communication delays between the CPU and GPU. A hardware verification system for distributed SAR real-time imaging processing based on multiple embedded GPUs is constructed. The proposed algorithm takes 5.86 s to process single-precision floating-point complex imaging with a data size of 8192 × 8192 on a single Jetson Nano platform. The actual power consumption is less than 5 W, and the performance-to-power ratio is greater than 1.7%. The experimental results show that the real-time processing method based on the embedded GPUs proposed in this article has high performance and low-power consumption.

組込み GPU に基づく編隊飛行SARの分散型リアルタイム画像処理

応用地球観測とリモートセンシングにおける厳選されたトピックのIEEE論文誌

編隊飛行合成開口レーダー(FF-SAR)システムは，マルチチャネルSARの重要な開発方向として，高解像度の広帯域イメージングを実現できる．衛星受信機からのデータをコヒーレントに組み合わせると，個々の衛星に基づく従来のリアルタイム処理システムに負担がかかる．軌道上リアルタイム処理プラットフォームの能力などの特性は，制約のあるメモリや並列計算リソースと適切にバランスをとる必要がある．この記事では、組込みグラフィックス処理ユニット(GPU)に基づく分散型SARリアルタイムイメージング手法を提案する．チャープ・スケーリング・アルゴリズムの並列計算方法を計算統合デバイス・アーキテクチャの並列プログラミング・モデルに基づいて設計し，メモリとパフォーマンスの最適化方法を組込みGPUのハードウェア・アーキテクチャに対して提案した．特に，CPUとGPU間のデータのコピーと通信の遅延を回避するために，統合メモリ管理方法が使用される．複数の組込みGPUに基づく分散SARリアルタイム画像処理のハードウェア検証システムを構築する．提案されたアルゴリズムは，単一のJetson Nanoプラットフォーム上でデータ サイズ8192×8192の単精度浮動小数点複素数イメージングを処理するのに5.86秒かかる．実際の消費電力は5W未満で，パフォーマンス対電力比は1.7％を超えている．実験結果は，本記事で提案した組込みGPUに基づくリアルタイム処理方法が高性能かつ低消費電力であることを示している．

## 解説

2つの論文は，どちらも人工衛星に搭載されることが多い合成開口レーダー(SAR)と，グラフィック処理ユニット(GPU)の両方を扱っています．しかし，Abstractの書き出しが対照的です．

1つ目の論文は，GPUの話から始めて，性能と消費電力をFPGAと比較することが大きな問題であると，主張した後で，その題材としてSARで用いられるアルゴリズムで比較評価しました，と述べています．

一方，2つ目の論文は，SARの一種の話から始めて，その場合のコンピューティング上の問題点を指摘し，GPUを用いて解決しました，と述べています．その際にGPUの特性に気をつけました，とも述べています．

つまり，コンピューティングの話題から始めて，宇宙に触れるのか，宇宙の話題から始めて，コンピューティングに触れるのか，説明の順番が真逆になっています．**このような違いはどこから来るのでしょうか？**

その違いの理由は，それぞれの論文がどこで発表されたかを見ると理解できるかもしれません．

1つ目の論文(**コンピューティング→宇宙**)は，**コンピューティング**とネットワーキングに関する国際シンポジウムです．

一方，2つ目の論文(**宇宙→コンピューティング**)は，応用**地球観測**と**リモートセンシング**における厳選されたトピックのIEEE論文誌，つまり航空**宇宙**分野の特定の話題です．

それぞれ，**どんな人たちが集うのでしょうか？**

1つ目の論文(**コンピューティング→宇宙**)は，名前からして，**コンピューティング**の専門家が幅広く集いそうですね．

一方，2つ目の論文(**宇宙→コンピューティング**)は，航空**宇宙**分野の特定の専門家が集いそうです．

つまり，**先に発表する学会の専門分野についての話題から始めている**のです．

それはなぜ？

**問題解決型の論文では，AbstractとIntroductionの書き出しは，想定する読者や聴衆のほとんどが疑問の余地なく合意できる話題からはじめて，その後，技術的課題を述べ，研究目的や提案手法を紹介するという順番で説明するのが一般的だからです．**

つまり，発表する学会の関心事に沿って，順番を書き分けないといけないのですね．

そこで，練習としては，一通り読んで理解した2つの分野の境界領域の論文があったときに，その論文が発表された学会とは異なる分野の方の学会で発表することを想定して，説明の順番を入れ替えて，プレゼンテーションを作ってみるということをすると，勉強になると思います．

あるいは，自分のメインの専門分野に関連する境界領域があったときに，その境界領域の，自分のメインの専門分野ではない方の分野の論文を探して，読んでみてはどうでしょうか．

新たな視点が拓けるように思います．

