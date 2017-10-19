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

GetAngry の部分を C++ で記述します。(ファイル名 pet.cpp)

```c++
// Pet sample

#include <iostream> // コンソール出力 cout, 改行 endl を使うため
#include <string> // 文字列 string を使うため

using namespace std; // これを書くと，たとえば std::cout と書かずに cout と省略できる

/*
 * クラス Pet: ペット型ロボットのクラス
 */
class Pet
{
public: // 以下のメンバー変数やメソッドを公開する
    virtual string GetAngry() = 0; // 抽象メソッド
    virtual ~Pet() {}
    /*
     * 今の時点では↑は，Cat や Dog を削除(delete)するときに
     * 必要な「おまじない」だと思ってください
     */
};

/*
 * クラス Cat: ネコ型ロボットのクラス
 * スーパークラスは Pet
 */
class Cat : public Pet
{
public:
    /*
     * メソッド GetAngry (怒る)
     */
    virtual string GetAngry()
    /*
     * 今の時点では， C++ ではメソッドに virtual とつけると，ポリモーフィズムが利いて，
     * サブクラスでメソッドの上書き(オーバーライド)ができるようになると理解してください
     */
    {
        return "ネコがひっかく";
    }
};

/*
 * クラス Dog: イヌ型ロボットのクラス
 * スーパークラスは Pet
 */
class Dog : public Pet
{
public:
    /*
     * メソッド GetAngry (怒る)
     */
    virtual string GetAngry()
    {
        return "イヌがほえる";
    }
};

int main()
{
    Pet* pet1 = new Cat(); // Cat(ネコ型ロボット)を実体化して，変数 pet1 に代入する
    cout << pet1->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet1->GetAngry());
    delete pet1; // C++ ではオブジェクトを使い終わったら必ず削除 (delete) する

    Pet* pet2 = new Dog();
    cout << pet2->GetAngry() << endl; // C言語風に書くと printf("%s\n", pet2->GetAngry());
    delete pet2;

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
    Pet* pet1 = new Cat();
    cout << pet1->GetAngry() << endl;
    delete pet1;

    Pet* pet2 = new Dog();
    cout << pet2->GetAngry() << endl;
    delete pet2;

    return 0;
}
```

前半部分では，Cat クラス(ネコ型ロボット)を生成して GetAngry メソッドを呼び出しています。その結果，「ネコがひっかく」と表示されます。後半部分では，Dog クラス(イヌ型ロボット)を生成して，GetAngry メソッドを呼び出しています。その結果，「イヌがほえる」と表示されます。

注目してほしいのは，メソッドを呼び出すコードが，ネコでもイヌでも pet1->GetAngry() もしくは pet2->GetAngry() と，全く同じコードの形をしているという点です。まったく同じなのに，ネコとイヌで振る舞いが異なります。このことをポリモーフィズム(polymorphism)と言います。

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
* virtual をつけると，ポリモーフィズムを有効にして，サブクラスでメソッドの上書き(オーバーライド)ができるようになります。今の時点では，C++ では原則的にメソッドに virtual をつける必要があると理解してください。

なお，C++ では次のように宣言と定義を分離して書くこともできます。大規模なプログラムを書くときには宣言と定義を分離し，宣言をヘッダファイル(.h)に書くことが一般的です。

```c++
// クラス Cat と メソッド GetAngry の宣言
class Cat : public Pet
{
public:
    virtual string GetAngry();
};

// クラス Cat のメソッド GetAngry の定義
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
    virtual string GetAngry() = 0;
    virtual ~Pet() {}
};
```

ポイントとなるのは，virtual string GetAngry() = 0; です。Pet クラスの GetAngry メソッドには実体がなく，単体では動作しません。これを抽象メソッド(abstract method) と言います。抽象メソッドを含むクラスのことを抽象クラス(abstract class)と言います。

動作しないコードを何のために書くのでしょうか？ 実は，こう書くことで，Pet クラスの GetAngry メソッドが呼ばれると，実際にはサブクラスで定義されている GetAngry メソッドが呼ばれるようになります。このようにスーパークラスのメソッドをサブクラスが定義しなおして上書きするような働きをするので，オーバーライド(override)と言います。

[ここまで読んだら本文に戻ってください。](/e-learning/OOPpolymorphism.html#ex)

<a name="product"></a>
# 演習問題のコード (ファイル名: product.cpp)


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

メソッド GetPrice，SetPrice を抽象メソッドではなく実体のあるメソッド(具象メソッド)として定義している点に注意してください。

なぜ具象メソッドにするかを説明します。本文で次のように説明しましたね。

> SetPrice メソッドは，スーパークラスに定義されています。この場合，サブクラスで SetPrice を呼び出すと，スーパークラスの SetPrice が呼ばれます。(ただし，サブクラスで SetPrice をオーバーライドしている時にはサブクラスの SetPrice が呼ばれます)  これを利用すると，サブクラスに共通する処理をスーパークラスで定義することができます。

また，この場合では，スーパークラスである商品クラス Product をそのまま Client で利用したいと考えています。そこで，Product は実体を持たせる必要があるので，実体を持てるクラス(具象クラス)として定義します。具象クラスとして定義するためには，全てのメソッドは具象メソッドである必要があります。この意味でも，SetPrice や GetPrice は具象メソッドとして定義したいというわけです。

ヒントですが，もしサブクラスで GetPrice や SetPrice をオーバーライドしない場合には，サブクラスのそれらのメソッドを呼び出すと，スーパークラスの対応するメソッドが呼び出されます。SetPrice はサブクラスでも振る舞いを変える必要がないので，サブクラスでは SetPrice をオーバーライドする必要はありません。一方，GetPrice は設問に与えられているように，サブクラスごとに振る舞いを変える必要があります。そのため，サブクラスでは GetPrice をオーバーライドしてやる必要があります。

[本文に戻る](/e-learning/OOPpolymorphism.html#ex3)
