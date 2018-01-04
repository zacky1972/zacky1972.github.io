// Light sample

#include <iostream>

using namespace std;

enum State
{
	LightOff,
	LightOn
};

class Light
{
    enum State state;

public:

    Light()
    {
    	this->state = LightOff;
    }
    virtual ~Light() {}
    virtual void TurnOn()
    {
		switch(state) {
		case LightOff:
		    cout << "点灯する" << endl;
		    state = LightOn;
		    break;

		default:
			break;
		}
    }
    virtual void TurnOff()
    {
    	switch(state) {
    	case LightOn:
		    cout << "消灯する" << endl;
		    state = LightOff;
		    break;

		default:
			break;
    	}
    }
};


int main()
{
    Light* light = new Light();
    light->TurnOn();
    light->TurnOff();
    light->TurnOn();
    light->TurnOff();
    delete light;
    return 0;
}