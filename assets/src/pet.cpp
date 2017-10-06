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

