/* Book Sample */

#include <iostream> // cout, endl を使うため
#include <string> // string を使うため

using namespace std;

/* Book: 本 */
class Book
{
private:
	string topic;

public:
	virtual string Kind()
	{
		return "本";
	}

	virtual void Read()
	{
		cout << this->Kind() << "を読む" << endl;
	}

	virtual void SetTopic(string topic)
	{
		this->topic = topic;
	}

	virtual string GetTopic()
	{
		return this->topic;
	}

	virtual void Study()
	{
		this->Read();
		cout << this->GetTopic() << "を学ぶ" << endl;
	}
};

class Magazine : public Book
{
	virtual string Kind()
	{
		return "雑誌";
	}
};

int main()
{
	Book* book1 = new Book();
	book1->SetTopic("語学");
	book1->Study();
	delete book1;

	Book* book2 = new Magazine();
	book2->SetTopic("ビジネス");
	book2->Study();
	delete book2;
}