---
title: オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(C++)
layout: post
excerpt: このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて C++ のサンプルプログラムを紹介します。
---
# オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(C++)

このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて C++ のサンプルプログラムを紹介します。

## 題材となるクラス図

次のペット型ロボットのクラス図をC++のプログラムにしてみます。

![ペット型ロボットのクラス図](/assets/images/pet-uml.png)

## C++でのプログラム例

GetAngry の部分を C++ で記述します。

```c++
// Pet sample

#include <iostream> // cout, endl を使うため
#include <string> // string を使うため

using namespace std; // これを書くと std::cout と書かずに cout と省略できる

class Pet // クラス Pet を定義する
{
public: // 以下のメンバー変数やメソッドを公開する
    virtual string GetAngry() = 0; // 抽象メソッド
    virtual ~Pet() {} // デストラクタ: delete で呼ばれる
};

class Cat : public Pet // スーパークラスが Pet であるようなクラス Cat を定義する
{
public:
    virtual string GetAngry() // C++ ではメソッドに virtual とつけるとポリモーフィズムが利くようになる
    {
        return "ネコがひっかく";
    }
};


class Dog : public Pet
{
public:
    virtual string GetAngry()
    {
        return "イヌがほえる";
    }
};

int main()
{
    Pet* pet = new Cat(); // Cat クラスのインスタンス(実体)を新規作成し，ポインタ変数 pet に代入する
    cout << pet->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet->GetAngry());
    delete pet; // C++ ではオブジェクトを使い終わったら必ず delete する

    pet = new Dog();
    cout << pet->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet->GetAngry());
    delete pet;

    return 0;
}
```

## コンパイル・実行方法

このプログラムはコマンドラインから次のようにコンパイル・実行します。

```shell-session
$ g++ pet.cpp
$ ./a.out
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

```c++
int main()
{
    Pet* pet = new Cat(); // Cat クラスのインスタンス(実体)を新規作成し，ポインタ変数 pet に代入する
    cout << pet->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet->GetAngry());
    delete pet; // C++ ではオブジェクトを使い終わったら必ず delete する

    pet = new Dog();
    cout << pet->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet->GetAngry());
    delete pet;

    return 0;
}
```

前半部分では，Cat クラス(ネコ型ロボット)を生成して GetAngry メソッドを呼び出しています。その結果，「ネコがひっかく」と表示されます。後半部分では，Dog クラス(イヌ型ロボット)を生成して，GetAngry メソッドを呼び出しています。その結果，「イヌがほえる」と表示されます。

注目してほしいのは，メソッドを呼び出すコードが，ネコでもイヌでも pet->GetAngry() であるという点です。まったく同じコードなのに，ネコとイヌで振る舞いが異なります。このことをポリモーフィズム(polymorphism)と言います。

以下で，ポリモーフィズムを働かせるためにどのようにプログラミングしているかを見ていきましょう。

### サブクラスのコード

サブクラスの1つ，Cat クラスは次のように定義しています。

```c++
class Cat : public Pet
{
public:
    virtual string GetAngry()
    {
        return "ネコがひっかく";
    }
};
```

* まず class Cat : public Pet とすることで，Cat が Pet を継承すると定義しています。
* 次に virtual string GetAngry() では GetAngry メソッドを定義しています。
* virtual をつけると，ポリモーフィズムを有効にします。C++ では明示的に virtual をつけないとポリモーフィズムが機能しません。

なお，C++ では次のように宣言と定義を分離して書くこともできます。大規模なプログラムを書くときには宣言と定義を分離し，宣言をヘッダファイル(.h)に書くことが一般的です。

```c++
class Cat : public Pet
{
public:
    virtual string GetAngry();
};

string Cat::GetAngry() {
    return "ネコがひっかく";
}
```

もう一つのサブクラス，Dog クラスも同様に定義します。

### スーパークラスのコード

スーパークラスである Pet クラスは次のように定義しています。

```c++
class Pet
{
public:
    virtual string GetAngry() = 0; // 抽象メソッド
    virtual ~Pet() {}
};
```

ポイントとなるのは，virtual string GetAngry() = 0; です。Pet クラスの GetAngry メソッドには実体がなく，単体では動作しません。これを抽象メソッド(abstract method) と言います。抽象メソッドを含むクラスのことを抽象クラス(abstract class)と言います。

動作しないコードを何のために書くのでしょうか？ 実は，こう書くことで，Pet クラスの GetAngry メソッドが呼ばれると，実際にはサブクラスで定義されている GetAngry メソッドが呼ばれるようになります。このようにスーパークラスのメソッドをサブクラスが定義しなおして上書きするような働きをするので，オーバーライド(override)と言います。

[ここまで読んだら本文に戻ってください。](/e-learning/OOPpolymorphism.html#ex)

<a name="product"></a>
# 演習問題のコード product.cpp 


```c++
// Product sample

#include <iostream>

using namespace std;

class Product
{
protected:
    int price;
public:
    virtual void SetPrice(int p)
    {
        this->price = p;
    }

    virtual int GetPrice()
    {
        return price;
    }

    virtual ~Product() {}
};

int main()
{
    Product* product = new Product();
    product->SetPrice(100);
    cout << "商品の価格は" << product->GetPrice() << "円" << endl;
    delete product;
    return 0;
}
```

[本文に戻る](/e-learning/OOPpolymorphism.html#ex3)
