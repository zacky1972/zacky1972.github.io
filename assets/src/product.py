# Product sample
# coding: utf-8

class Product():
  price = 0
  def setPrice(self, p):
    self.price = p
  def getPrice(self):
    return self.price

product = Product()
product.setPrice(100)
print("商品の価格は" + str(product.getPrice()) + "円")

