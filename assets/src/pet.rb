# Pet sample

class Pet
   def getAngry
   end
end

class Cat < Pet
   def getAngry
      "ネコがひっかく"
   end
end

class Dog < Pet
   def getAngry
      "イヌがほえる"
   end
end

pet = Cat.new
puts pet.getAngry
pet = Dog.new
puts pet.getAngry
