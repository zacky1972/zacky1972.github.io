// Product sample

#include <iostream>

using namespace std;

class Product
{
protected:
    int price;
public:
    virtual int GetPrice()
    {
        return price;
    }

    virtual ~Product() {}
};
