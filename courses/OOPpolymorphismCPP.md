---
title: オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(C++)
layout: post
excerpt: このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて C++ のサンプルプログラムを紹介します。
---
# オブジェクト指向プログラミング〜ポリモーフィズムのサンプルプログラム(C++)

このテキストでは，オブジェクト指向プログラミングの原動力であるポリモーフィズムについて C++ のサンプルプログラムを紹介します。

次のペット型ロボットのクラス図をC++のプログラムにしてみます。

![ペット型ロボットのクラス図](/assets/images/pet-uml.png)

getAngry の部分を C++ で記述します。

```C++
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

このプログラムはコマンドラインから次のようにコンパイル・実行します。

```shell-session
$ g++ pet.cpp
$ ./a.out
ネコがひっかく
イヌがほえる
```

