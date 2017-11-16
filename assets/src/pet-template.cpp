// Pet Template Method Pattern

#include <iostream>
#include <string>

using namespace std;

/* 
 * Pet: ペット型ロボット
 */
class Pet
{
public:
	virtual ~Pet() {}
	/*
	 * Eat: エサ (food) を食べる
	 */ 
	virtual void Eat(string food)
	{
		this->BeforeEat(food);
		this->AfterEat(food);
	}
protected:
	/*
	 * BeforeEat: エサ (food) を食べる前の動作を行う
	 * 次の2つを表示する
	 * 1. エサのにおいを嗅ぐ
	 * 2. エサを口に入れる 
	 */ 
	virtual void BeforeEat(string food)
	{
		cout << food << "のにおいを嗅ぐ" << endl;
		cout << food << "を口に入れる" << endl;
	}
	/*
	 * AfterEat: エサ (food)を食べた後の動作を行う
	 * 抽象メソッドにしてサブクラスで処理を行う
	 */
	virtual void AfterEat(string food) = 0;
};

/* 
 * Cat: ネコ型ロボット
 */
class Cat : public Pet
{
protected:
	/*
	 * AfterEat: エサ (food)を食べた後の動作を行う
	 * 	3. エサに砂をかける動作をする
	 * 4. 毛づくろいする
	 */
	virtual void AfterEat(string food) {
		// ここに食べた後の処理を記述する
	}
};

int main()
{
	Pet* pet1 = new Cat();
	pet1->Eat("ネズミ");
	delete pet1;
	return 0;
}

