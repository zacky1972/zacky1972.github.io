// Pet sample

#include <iostream>
#include <string>

using namespace std;

class Pet
{
public:
    virtual std::string GetAngry() = 0;
    virtual ~Pet() {}
};

class Cat : public Pet
{
public:
    virtual std::string GetAngry()
    {
        return "ネコがひっかく";
    }
};


class Dog : public Pet
{
public:
    virtual std::string GetAngry()
    {
        return "イヌがほえる";
    }
};

int main()
{
	Pet* pet = new Cat();
    std::cout << pet->GetAngry() << std::endl;
    delete pet;

	pet = new Dog();
    std::cout << pet->GetAngry() << std::endl;
    delete pet;

    return 0;
}

