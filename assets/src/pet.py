# Pet sample

class Pet():
    def getAngry(self):
         pass

class Cat(Pet):
    def getAngry(self):
        return 'ネコがひっかく'

class Dog(Pet):
    def getAngry(self):
        return 'イヌがほえる'

pet = Cat()
print(pet.getAngry())
pet = Dog()
print(pet.getAngry())
