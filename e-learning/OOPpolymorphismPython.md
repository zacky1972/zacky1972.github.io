---
title: オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(Python)
layout: post
excerpt: このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて Python のサンプルプログラムを紹介します。
---
# オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(Python)

このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて Python のサンプルプログラムを紹介します。

## 題材となるクラス図

次のペット型ロボットのクラス図をPythonのプログラムにしてみます。

![ペット型ロボットのクラス図](/assets/images/pet-uml.png)

## Pythonでのプログラム例

GetAngry の部分を Python で記述します。(ファイル名 pet.py)

```python
# Pet sample
# coding: utf-8

class Pet():
    def getAngry(self):
         pass

class Cat(Pet):
    def getAngry(self):
        return 'ネコがひっかく'

class Dog(Pet):
    def getAngry(self):
        return 'イヌがほえる'

pet = Cat()
print(pet.getAngry())
pet = Dog()
print(pet.getAngry())
```

## 実行方法

このプログラムは Python 3 系列を前提に書かれています。そのため，Python のバージョンが 3 以上であることを確認します。

```
$ python --version
Python 2.7.10
```

この例では Python 2 系列であるバージョン 2.7.10 です。Python 3 系列に切り替えてやる必要があります。

Python のバージョンを切り替えるには pyenv を使うことが多いです。まず，pyenv でインストールされているバージョンを確認しましょう。

```
$ pyenv versions
* system (set by /***/.pyenv/version)
```

この場合はバージョンが1つしかないので，別のバージョンの Python をインストールする必要があります。インストールできる Python のバージョンのリストは次のコマンドを入力します。

```
$ pyenv install -l
Available versions:
  2.1.3
  2.2.3
  2.3.7
  2.4
...
  3.5.3
  3.5.4
  3.6.0
  3.6-dev
  3.6.1
  3.6.2
  3.6.3
  3.7.0a1
  3.7-dev
...
  anaconda-1.4.0
  anaconda-1.5.0
  anaconda-1.5.1
  anaconda-1.6.0
  anaconda-1.6.1
...
  anaconda3-2.4.1
  anaconda3-2.5.0
  anaconda3-4.0.0
  anaconda3-4.1.0
  anaconda3-4.1.1
...
```

この場合，バージョン3の安定版である，3.6.* もしくは anaconda3-* をインストールするといいでしょう。(演習室環境ではインストール済みです)

たとえば 3.6.0 をインストールする場合は次のように入力します。

```
$ pyenv install 3.6.0
```

anaconda3-4.3.0 をインストールする場合は次のように入力します。

```
$ pyenv install anaconda3-4.3.0
```

改めてバージョンリストを表示すると次のようになります。(演習室環境では2017年11月現在この状態です)

```
$ pyenv versions
* system (set by /***/.pyenv/version)
  3.6.0
  anaconda3-4.3.0
```

使用するバージョンを切り替えるには，たとえば次のように入力します。

```
$ pyenv global anaconda3-4.3.0
$ pyenv versions
  system
  3.6.0
* anaconda3-4.3.0 (set by /***/.pyenv/version)
```

実行するには次のように入力しましょう。

```
$ python pet.py
ネコがひっかく
イヌがほえる
```

## 解説

実現したいことは，次の通りです。

* ネコ型ロボットは，怒る時に，ひっかく
* イヌ型ロボットは，怒る時に，ほえる

プログラム例では，単にコンソールに「ネコがひっかく」「イヌがほえる」と表示するだけですが，この部分をロボットを実際に動かすコードを記述したメソッドの呼び出しに置き換えることで，感情に沿ってロボット制御を指令するプログラムに仕立てることができる点に注意してください。

### Client のコード

Client に相当するコードは次の部分です。

```python
pet = Cat()
print(pet.getAngry())
pet = Dog()
print(pet.getAngry())
```

前半部分では，Cat クラス(ネコ型ロボット)を生成して getAngry メソッドを呼び出しています。その結果，「ネコがひっかく」と表示されます。後半部分では，Dog クラス(イヌ型ロボット)を生成して，getAngry メソッドを呼び出しています。その結果，「イヌがほえる」と表示されます。

注目してほしいのは，メソッドを呼び出すコードが，ネコでもイヌでも pet.getAngry() と，全く同じコードの形をしているという点です。まったく同じなのに，ネコとイヌで振る舞いが異なります。このことをポリモーフィズム(polymorphism)と言います。

以下で，ポリモーフィズムを働かせるためにどのようにプログラミングしているかを見ていきましょう。

### サブクラスのコード

サブクラスの1つ，Cat クラスは次のように定義しています。

```python
class Cat(Pet):
    def getAngry(self):
        return 'ネコがひっかく'
```

* まず class Cat(Pet) とすることで，Cat が Pet を継承すると定義しています。
* 次に def getAngry(self): では getAngry メソッドを定義しています。

もう一つのサブクラス，Dog クラスも同様に定義します。

```python
class Dog(Pet):
    def getAngry(self):
        return 'イヌがほえる'
```

### スーパークラスのコード

スーパークラスである Pet クラスは次のように定義しています。

```python
class Pet():
    def getAngry(self):
         pass
```

ポイントとなるのは，pass です。Pet クラスの getAngry メソッドには実体がなく，単体では動作しません。これを抽象メソッド(abstract method) と言います。抽象メソッドを含むクラスのことを抽象クラス(abstract class)と言います。

動作しないコードを何のために書くのでしょうか？ 実は，こう書くことで，Pet クラスの getAngry メソッドが呼ばれると，実際にはサブクラスで定義されている getAngry メソッドが呼ばれるようになります。このようにスーパークラスのメソッドをサブクラスが定義しなおして上書きするような働きをするので，オーバーライド(override)と言います。

[ここまで読んだら本文に戻ってください。](/e-learning/OOPpolymorphism.html#ex)

<a name="product"></a>
# 演習問題のコード (ファイル名: product.py)

```python
# Product sample
# coding: utf-8

class Product():
  price = 0
  def setPrice(self, p):
    self.price = p
  def getPrice(self):
    return self.price

product = Product()
product.setPrice(100)
print("商品の価格は" + str(product.getPrice()) + "円")
```

メソッド getPrice，setPrice を抽象メソッドではなく実体のあるメソッド(具象メソッド)として定義している点に注意してください。

なぜ具象メソッドにするかを説明します。本文で次のように説明しましたね。

> setPrice メソッドは，スーパークラスに定義されています。この場合，サブクラスで setPrice を呼び出すと，スーパークラスの setPrice が呼ばれます。(ただし，サブクラスで setPrice をオーバーライドしている時にはサブクラスの setPrice が呼ばれます)  これを利用すると，サブクラスに共通する処理をスーパークラスで定義することができます。

また，この場合では，スーパークラスである商品クラス Product をそのまま Client で利用したいと考えています。そこで，Product は実体を持たせる必要があるので，実体を持てるクラス(具象クラス)として定義します。具象クラスとして定義するためには，全てのメソッドは具象メソッドである必要があります。この意味でも，setPrice や getPrice は具象メソッドとして定義したいというわけです。

ヒントですが，もしサブクラスで getPrice や setPrice をオーバーライドしない場合には，サブクラスのそれらのメソッドを呼び出すと，スーパークラスの対応するメソッドが呼び出されます。setPrice はサブクラスでも振る舞いを変える必要がないので，サブクラスでは setPrice をオーバーライドする必要はありません。一方，getPrice は設問に与えられているように，サブクラスごとに振る舞いを変える必要があります。そのため，サブクラスでは getPrice をオーバーライドしてやる必要があります。

[本文に戻る](/e-learning/OOPpolymorphism.html#ex3)
