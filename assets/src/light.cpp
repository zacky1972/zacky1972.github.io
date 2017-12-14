// Light sample

#include <iostream>

using namespace std;

class Light;

class LightState
{
protected:
    static void SetState(Light* light, const LightState* state);

public:
    virtual ~LightState() {}
    virtual void TurnOn(Light* light) {}
    virtual void TurnOff(Light* light) {}
};

class LightOff : public LightState
{
public:
    LightOff() {}
    virtual void TurnOn(Light* light);
};


class LightOn : public LightState
{
public:
    LightOn() {}
    virtual void TurnOff(Light* light);
};

class Light
{
    LightState* state;

protected:
    virtual void SetState(const LightState* state)
    {
        this->state = const_cast<LightState*>(state);
    }

public:
    const static LightState* lightOff; 
    const static LightState* lightOn; 
    friend class LightState;

    Light()
    {
        this->SetState(lightOff);
    }
    virtual ~Light() {}
    virtual void TurnOn()
    {
        this->state->TurnOn(this);
    }
    virtual void TurnOff()
    {
        this->state->TurnOff(this);
    }
};


const LightState* Light::lightOff = new LightOff();
const LightState* Light::lightOn = new LightOn();

void LightState::SetState(Light* light, const LightState* state)
{
    light->SetState(state);
}

void LightOff::TurnOn(Light* light)
{
    cout << "点灯する" << endl;
    SetState(light, Light::lightOn);
}

void LightOn::TurnOff(Light* light)
{
    cout << "消灯する" << endl;
    SetState(light, Light::lightOff);
}

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