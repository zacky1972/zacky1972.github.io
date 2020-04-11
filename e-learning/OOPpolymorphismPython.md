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

from abc import ABCMeta, abstractmethod

class Pet(metaclass=ABCMeta):
    @abstractmethod
    def getAngry(self): pass

class Cat(Pet):
    def getAngry(self):
        print('ネコがひっかく')

class Dog(Pet):
    def getAngry(self):
        print('イヌがほえる')

pet = Cat()
pet.getAngry()
pet = Dog()
pet.getAngry()
```

## 実行方法

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
pet.getAngry()
pet = Dog()
pet.getAngry()
```

前半部分では，Cat クラス(ネコ型ロボット)を生成して getAngry メソッドを呼び出しています。その結果，「ネコがひっかく」と表示されます。後半部分では，Dog クラス(イヌ型ロボット)を生成して，getAngry メソッドを呼び出しています。その結果，「イヌがほえる」と表示されます。

注目してほしいのは，メソッドを呼び出すコードが，ネコでもイヌでも pet.getAngry() と，全く同じコードの形をしているという点です。まったく同じなのに，ネコとイヌで振る舞いが異なります。このことをポリモーフィズム(polymorphism)と言います。

以下で，ポリモーフィズムを働かせるためにどのようにプログラミングしているかを見ていきましょう。

### サブクラスのコード

サブクラスの1つ，Cat クラスは次のように定義しています。

```python
class Cat(Pet):
    def getAngry(self):
        print('ネコがひっかく')
```

* まず class Cat(Pet) とすることで，Cat が Pet を継承すると定義しています。
* 次に def getAngry(self): では getAngry メソッドを定義しています。

もう一つのサブクラス，Dog クラスも同様に定義します。

```python
class Dog(Pet):
    def getAngry(self):
        print('イヌがほえる')
```

このように Python では，異なるクラスに同じ名前のメソッドを持たせることで，ポリモーフィズムを実現します。

### スーパークラスのコード

スーパークラスである Pet クラスは次のように定義しています。

```python
from abc import ABCMeta, abstractmethod

class Pet(metaclass=ABCMeta):
    @abstractmethod
    def getAngry(self): pass
```

ポイントとなるのは，`@abstractmethod` と `pass` です。これらを書いているので，Pet クラスは単体では動作しません。

たとえば次のようなプログラムを書くとエラーになります。

```python
from abc import ABCMeta, abstractmethod

class Pet(metaclass=ABCMeta):
    @abstractmethod
    def getAngry(self): pass

pet = Pet() # エラーになる
```

動作しないコードを何のために書くのでしょうか？ 実は，こう書くことで，Pet クラスを継承した時に，サブクラスで getAngry メソッドを必ず上書き(オーバーライド: override)して定義することが求められます。そうしないで実体を作ろうとするとエラーになります。

```python
from abc import ABCMeta, abstractmethod

class Pet(metaclass=ABCMeta):
    @abstractmethod
    def getAngry(self): pass

class Cat(Pet): pass

pet = Cat() # エラーになる
```

### どのように呼び出されるか

下記の Client のコードでの `pet.getAngry()` について，

```python
pet = Cat()
pet.getAngry()
```

変数 `pet` の実態は `Cat` クラスですので，まず `Pet` クラスの定義を見にいきます。

```python
class Cat(Pet):
    def getAngry(self):
        print('ネコがひっかく')
```

ここで，`getAngry` メソッドが定義されているので，これが呼び出されて「ネコがひっかく」と表示します。

もしこの `Cat` クラスが次のように定義されていたとします。

```python
class Cat(Pet): pass
```

ここには `getAngry` メソッドが定義されていないので，スーパークラスである `Pet` クラスを見にいきます。

```python
from abc import ABCMeta, abstractmethod

class Pet(metaclass=ABCMeta):
    @abstractmethod
    def getAngry(self): pass
```

`getAngry` が抽象メソッド `@abstractmethod` であると宣言されています。そのため，`getAngry` メソッドを `Cat` で定義してほしいと，エラーを出して終了します。

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
