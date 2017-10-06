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

#include <iostream>
#include <string>

using namespace std;

class Pet
{
public:
    virtual string GetAngry() = 0;
    virtual ~Pet() {}
};

class Cat : public Pet
{
public:
    virtual string GetAngry()
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
    Pet* pet = new Cat();
    cout << pet->GetAngry() << endl;
    // C言語風に書くと
    // printf("%s\n", pet->GetAngry());
    delete pet;

    pet = new Dog();
    cout << pet->GetAngry() << endl;
    // C言語風に書くと
    // printf("%s\n", pet->GetAngry());
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

