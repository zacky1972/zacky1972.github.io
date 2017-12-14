# Light sample
# coding: utf-8

class LightState():
    @staticmethod
    def setState(light, state):
        light.setState(state)
    def turnOn(self, light):
        pass
    def turnOff(self, light):
        pass

class LightOff(LightState):
    def turnOn(self, light):
        print('点灯する')
        LightState.setState(light, Light.lightOn)

class LightOn(LightState):
    def turnOff(self, light):
        print('消灯する')
        LightState.setState(light, Light.lightOff)

class Light():
    lightOff = LightOff()
    lightOn = LightOn()

    def __init__(self):
        self.state = Light.lightOff

    def setState(self, state):
        self.state = state

    def turnOn(self):
        self.state.turnOn(self)

    def turnOff(self):
        self.state.turnOff(self)

light = Light()
light.turnOn()
light.turnOff()
light.turnOn()
light.turnOff()
