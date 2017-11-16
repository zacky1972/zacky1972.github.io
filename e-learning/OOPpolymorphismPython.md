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

