// Product sample

#include <iostream>

using namespace std;

class Product
{
protected:
    int price;
public:
    void SetPrice(int p)
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
    return 0;
}
